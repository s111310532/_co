// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/6/max/Max.asm

// Computes R2 = max(R0, R1)  (R0,R1,R2 refer to RAM[0],RAM[1],RAM[2])
// Usage: Before executing, put two values in R0 and R1.
Moving from simple addition to finding the maximum of two numbers introduces a core concept of computer science: Conditional Branching.In the Hack assembly language, we don't have an if statement. Instead, we perform a subtraction, check the result in the ALU (is it positive, negative, or zero?), and then "jump" to a different part of the code based on that result.The Max.asm ImplementationHere is the assembly code to compute $R2 = \max(R0, R1)$.程式碼片段// Computes R2 = max(R0, R1)

   @R0
   D=M     
   
   @R1
   D=D-M    

   @OUTPUT_R1
   D;JLT    

   @R0
   D=M      
   @STORE
   0;JMP    

(OUTPUT_R1)
   @R1
   D=M     

(STORE)
   @R2
   M=D      

(END)
   @END
   0;JMP    
