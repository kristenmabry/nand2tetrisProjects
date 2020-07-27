// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
@KBD
D=M
@BLACK
D;JGT

@SCREEN
D=M
@LOOP
D;JEQ       // skip if screen is already white
@color
M=0
@FILL
0;JMP

(BLACK)
@SCREEN
D=M
@LOOP
D;JGT       // skip if screen is already filled
@color
M=-1

(FILL)
@SCREEN
D=A
@pos
M=D         // init position ptr

@8192
D=A
@counter
M=D         // init counter

(SETCOLOR)
@counter
D=M
@LOOP
D;JEQ       // while counter > 0

@color
D=M
@pos
A=M
M=D         // [pos]=color

@pos
M=M+1       // increment ptr

@counter
M=M-1

@SETCOLOR
0;JMP