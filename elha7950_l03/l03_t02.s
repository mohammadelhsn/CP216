/*
-------------------------------------------------------
l03_t02.s
-------------------------------------------------------
Author: Mohammad El-Hassan
ID: 169067950
Email: elha7950@mylaurier.ca
Date: 2024/02/07
-------------------------------------------------------
A simple count down program (bge)
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Store data in registers
LDR r3, =COUNTER  // Initialize a countdown value

TOP:
sub r3, r3, #1 // Decrement the countdown value
cmp r3, #0  // Compare the countdown value to 0
bge TOP   // Branch to top under certain conditions

_stop:
b _stop

.data
COUNTER: //address is 00001018 in hex
.word 5

.end
