// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
// Mult.asm
// R2 = R0 * R1
// 使用重複加法：將 R0 加到 R2，共執行 R1 次。

    // 初始化 R2 為 0
    @R2
    M=0

    // 初始化計數器 i = R1
    @R1
    D=M
    @i
    M=D

(LOOP)
    // 檢查計數器 i 是否為 0，如果是則跳轉到 END
    @i
    D=M
    @END
    D;JLE    // if i <= 0 goto END

    // 執行加法：R2 = R2 + R0
    @R0
    D=M
    @R2
    M=D+M

    // 計數器遞減：i = i - 1
    @i
    M=M-1

    // 回到迴圈起點
    @LOOP
    0;JMP

(END)
    @END
    0;JMP    // 無限迴圈結束程式

