// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/6/rect/Rect.asm

// Draws a rectangle at the top-left corner of the screen.
// The rectangle is 16 pixels wide and R0 pixels high.
// Usage: Before executing, put a value in R0.
   @R0
   D=M
   @END
   D;JLE    

   @n
   M=D      

   @SCREEN
   D=A
   @address
   M=D      

(LOOP)
   @address
   A=M
   M=-1    

   @32
   D=A
   @address
   M=D+M    

   @n
   M=M-1   
   D=M
   @LOOP
   D;JGT    

(END)
   @END
   0;JMP    
