/*
-------------------------------------------------------
intro.s
-------------------------------------------------------
Author: Mohammad El-Hassan
ID: 169067950
Email: elha7950@mylaurier.ca
Date: 01/12/2925
-------------------------------------------------------
Assign to and add contents of registers.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Task 1 -- Changing to 14 didn't do anything. 
mov r0, #9       // Store decimal 9 in register r0
mov r1, #14     // Store hex E (decimal 14) in register r1
add r2, r1, r0  // Add the contents of r0 and r1 and put result in r2

// Task 2 -- No problems here
mov r3, #8
add r3, r3, r3 // adds r3 to r3 and puts it into r3

// Task 3 
// add r4, #4, #5 (this errors)
// But when a register is used in the middle...
add r4, r3, #5 // this works.


// End program
_stop:
b _stop
