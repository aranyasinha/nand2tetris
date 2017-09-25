// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
@8192
D=A
@n
M=D

(START)
  @i
  M=0

  @SCREEN
  D=A
  @addr
  M=D
  
  @KBD
  D=M
  
  @BLACKEN
  D;JGT
  
  @WHITEN
  D;JEQ
  
  (BLACKEN)
    @i
	D=M
	@n
	D=D-M 
	@START 
	D;JEQ
	
	@addr
	A=M
	M=-1
	@addr
	M=M+1
	
	
    @i
    M=M+1
    @BLACKEN
    0;JMP  
	
  (WHITEN)
    @i
	D=M
	@n
	D=D-M 
	@START 
	D;JEQ 
		
	@addr
	A=M
	M=0
	@addr
	M=M+1 
	
    @i
    M=M+1
    @WHITEN
    0;JMP    
  
  @START
  0;JMP
