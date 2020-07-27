// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@R1
D=M 
@sum
M=D     // sum = R1
@R0
D=M
@counter
M=D-1     // counter = R0 - 1

(LOOP)
@counter
D=M
@ZERO
D;JLT
@ASSIGN
D;JEQ    // while counter > 0

@R1
D=M
@sum
M=D+M   // sum = sum + R1

@counter
M=M-1   // --counter

@LOOP
0;JMP

(ZERO)
@R2
M=0
@END
0;JMP

(ASSIGN)
@sum
D=M
@R2
M=D     // R2 = sum

(END)
@END
0;JMP   // terminate

