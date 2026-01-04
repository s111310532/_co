// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
// Fill.asm
// 當按下按鍵，螢幕變黑 (fill)；放開按鍵，螢幕變白 (clear)

(LOOP)
    // 1. 檢查鍵盤狀態
    @KBD
    D=M
    
    @FILL
    D;JNE    // 如果 KBD != 0 (有按鍵)，跳轉到 FILL
    
    @CLEAR
    0;JMP    // 否則跳轉到 CLEAR

(FILL)
    @color
    M=-1     // -1 在二進位是 1111111111111111 (全黑)
    @DRAW
    0;JMP

(CLEAR)
    @color
    M=0      // 0 在二進位是 0000000000000000 (全白)
    @DRAW
    0;JMP

(DRAW)
    // 初始化繪製變數
    @SCREEN
    D=A
    @addr
    M=D      // addr = 16384 (螢幕起始位址)

(DRAW_LOOP)
    // 將顏色寫入目前的 addr
    @color
    D=M
    @addr
    A=M
    M=D

    // addr 遞增
    @addr
    M=M+1
    
    // 檢查是否畫完所有螢幕位址 (16384 到 24575)
    // 螢幕共有 8192 個 16-bit 字組 (256列 * 512行 / 16)
    @24576   // 這是 KBD 的位址，也是 SCREEN 結束後的下一個位址
    D=A
    @addr
    D=D-M
    
    @DRAW_LOOP
    D;JGT    // 如果 24576 - addr > 0，繼續畫

    @LOOP
    0;JMP    // 畫完後回到主迴圈檢查鍵盤

