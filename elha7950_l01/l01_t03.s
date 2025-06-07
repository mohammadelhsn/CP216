/*
-------------------------------------------------------
l01_t03.s
-------------------------------------------------------
Author: Mohammad El-Hassan
ID: 169067950
Email: elha7950@mylaurier.ca
Date: 2025/01/12
-------------------------------------------------------
Assign to and add contents of registers.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

//========== Task 1 -- Changing to 14 didn't do anything. ===========//
// Store decimal 9 in register 0
mov r0, #9
// Store hex E, (Decimal 14) in register 1
mov r1, #14
// Add the contents of r0 and r1 and put result in r2
add r2, r1, r0
//========== Task 2 -- No problems here. ===========//
// Move the number 8, into r3
mov r3, #8
// Adds r3 to r3 and puts it into r3
add r3, r3, r3 // adds r3 to r3 and puts it into r3
//========== Task 3 -- Errors. ===========//
/*
 * This errors because you can't use 2 decimals. 
 * It needs to be a register, only the last can be a decimal 
 * add r4, #4 #5 
 */
// This works fine
add r4, r3, #5 
//========================================//
// End program
_stop:
b _stop
