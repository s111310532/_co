// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/6/max/MaxL.asm

// Symbol-less version of the Max.asm program.
// Designed for testing the basic version of the assembler.
@0
D=M

@1
D=D-M   

@10
D;JLT   

@0
D=M     

@12
0;JMP    

@1
D=M      
