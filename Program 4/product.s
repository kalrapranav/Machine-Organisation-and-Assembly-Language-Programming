*----------------------------------------------------------------------
* Programmer: Pranav Kalra
* Class Account: css1592
* Assignment or Title: Programming Assignment #4
* Filename: product.s
* Date completed: 05/14/2019
*----------------------------------------------------------------------
*---------------------------------------------------------------------
 ORG $6000
 a: EQU 8
 b: EQU 10
*----------------------------------------------------------------------
product: link A6,#0             

	movem.l D1-D2,-(SP)
	move.w  a(A6),D1          
	move.w  b(A6),D2   
	cmp.w   D2,D1                  
	BHS     go	*branch to go
	
	move.w  D1,-(SP)          
	move.w  D2,-(SP)         
	jsr     product          
	adda.l  #4,SP             
	bra     out
  
     
	go:  cmpi.w   #1,D2	*comparing
	
	beq     comeback	*branch to comeback
	tst.w    D2		*test D2
	beq      finish		*branch to finish                   
	subi.w  #1,D2		*subtract 1 from D2            
	move.w  D2,-(SP)	*pushes D2 to stack
	move.w  D1,-(SP)        *pushes D1 to stack
	jsr     product
	adda.l  #4,SP		*sets offset
	andi.l #$0000FFFF,D1
	add.l   D1,D0       
	bra     out	*branch to out
	
*----------------------------------------------------------------
	
	comeback:  move.l   D1,D0                
	bra      out
	finish:   moveq.l  #0,D0                  
	out:   movem.l (SP)+,D1-D2     
	unlk     A6
	rts
	
  end
