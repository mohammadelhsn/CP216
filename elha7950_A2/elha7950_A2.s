.org 0x1000          // Start at memory location 1000

.text                // Code section
.global _start

_start:
    // Initialize registers
    ldr r0, =Data      // Load the address of the Data list
    ldr r1, =0x00001500 // Load the starting memory address (0x00001500)
    ldr r2, =lookup_table  // Load the address of the lookup table
    ldr r5, =_Data
    // Loop through the Data list
Loop:
    ldr r3, [r0], #4  // Load the current value from Data, post-increment r0 (move to next value)
    ldrb r4, [r2, r3] // Load the corresponding ASCII value from the lookup table (r3 is the index)
    strb r4, [r1], #1  
    cmp r0, r5   
    bne Loop           

_stop:
    b _stop           

.data  
.align
Data:
    .word 0xA, 0xB, 0xC, 0x1, 0x2, 0x4, 0x9, 0x3
    .word 0xD, 0xF, 0xE, 0x7, 0x5, 0x6, 0x8, 0x0
_Data:

lookup_table:
    .byte 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37   // '0' to '7'
    .byte 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46   // '8' to 'F'
_lookup_table:
.end
