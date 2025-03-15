/*
-------------------------------------------------------
l06_t03.s
-------------------------------------------------------
Author: Mohammad El-Hassan
ID: 169067950
Email: elha7950@mylaurier.ca
Date: 2024-02-22
-------------------------------------------------------
Working with stack frames.
Finds the common prefix of two null-terminate strings.
-------------------------------------------------------
*/
// Constants
.equ SIZE, 80

.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

//=======================================================
// Push parameters onto the stack
//=======================================================
ldr     r3, =SIZE       // Load the max size of common prefix
stmfd   sp!, {r3}       // Push max size onto stack

ldr     r3, =Common     // Load address of storage for common prefix
stmfd   sp!, {r3}       // Push common storage address onto stack

ldr     r3, =Second     // Load address of second string
stmfd   sp!, {r3}       // Push second string address onto stack

ldr     r3, =First      // Load address of first string
stmfd   sp!, {r3}       // Push first string address onto stack

// Call the subroutine
bl      FindCommon

//=======================================================
// Clean up stack after function call
//=======================================================
add     sp, sp, #16     // Release 4 parameters (4x4 bytes) from stack

_stop:
b      _stop            // Infinite loop to stop execution

//-------------------------------------------------------
FindCommon:
/*
-------------------------------------------------------
Equivalent of: FindCommon(*first, *second, *common, size)
Finds the common parts of two null-terminated strings from the beginning of the
strings.
-------------------------------------------------------
Parameters:
  first - pointer to start of first string
  second - pointer to start of second string
  common - pointer to storage of common string
  size - maximum size of common
-------------------------------------------------------
*/

//=======================================================
// Prologue: Save registers and get parameters from stack
//=======================================================
stmfd   sp!, {fp, lr}   // Save frame pointer and link register
mov     fp, sp          // Set new frame pointer
stmfd   sp!, {r0-r5}    // Save working registers

ldr     r0, [fp, #8]    // Load address of first string
ldr     r1, [fp, #12]   // Load address of second string
ldr     r2, [fp, #16]   // Load address of common string
ldr     r3, [fp, #20]   // Load max size of common

//=======================================================
// Common prefix comparison loop
//=======================================================
FCLoop:
cmp     r3, #1          // Check if space left for common string
beq     _FindCommon     // If no space left, exit function

ldrb    r4, [r0], #1    // Load next char from first string
ldrb    r5, [r1], #1    // Load next char from second string
cmp     r4, r5
bne     _FindCommon     // If characters don’t match, exit

cmp     r5, #0          // Check for end of either string
beq     _FindCommon

strb    r4, [r2], #1    // Store character in common prefix
sub     r3, r3, #1      // Decrease available space in common string
b       FCLoop          // Repeat loop

_FindCommon:
mov     r4, #0          // Null terminator for common string
strb    r4, [r2]        // Store null terminator

//=======================================================
// Epilogue: Restore registers and return
//=======================================================
ldmfd   sp!, {r0-r5}    // Restore registers
ldmfd   sp!, {fp, lr}   // Restore frame pointer and link register
bx      lr              // Return from subroutine

//-------------------------------------------------------
.data
First:
.asciz "pandemic"
Second:
.asciz "pandemonium"
Common:
.space SIZE

.end
