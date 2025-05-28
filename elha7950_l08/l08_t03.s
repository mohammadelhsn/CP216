/*
-------------------------------------------------------
l08_t03.s
-------------------------------------------------------
Author: Mohammad El-Hassan
ID: 169067950
Email: elha7950@mylaurier.ca
Date:    2024-02-21
-------------------------------------------------------
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
*/
.org 0x1000   // Start at memory location 1000
.text         // Code section
.global _start
_start:

bl    EchoString

_stop:
b _stop

// Subroutine constants
.equ UART_BASE, 0xff201000  // UART base address
.equ VALID, 0x8000          // Valid data in UART mask
.equ ENTER, 0x0A            // The enter key code

EchoString:
/*
-------------------------------------------------------
Echoes a string from the UART to the UART.
-------------------------------------------------------
Uses:
  r0 - holds character to print
  r1 - address of UART
-------------------------------------------------------
*/

//=======================================================

stmfd sp!, {r0-r1}
ldr r1, =UART_BASE

esLoop:
ldr r0, [r1]
tst r0, #VALID
beq esLoop

cmp r0, #ENTER
beq _EchoExit

str r0, [r1]
b esLoop

_EchoExit:
ldmfd sp!, {r0-r1}

//=======================================================


bx    lr               // return from subroutine

.end