*----------------------------------------------------------------------
* Programmer: Pranav Kalra
* Class Account: css1592
* Assignment or Title: Programming Assignment #4
* Filename: prog4.s
* Date completed: 05/14/19 
*----------------------------------------------------------------------
* Problem statement: Use a subroutine to implement a recursive 
* 		     algorithm to calculate the product of two
*		     numbers 		
* Input: Two Interger  number for multiplication
* Output: The product if the two numbers 
* Error conditions tested: None.
* Included files: product.s
*		  /home/ma/cs237/bsvc/iomacs.s
*                 /home/ma/cs237/bsvc/casemacs.c
* Method and/or pseudocode: 
*	print product(n)
* 	long product(int n){
*		if(n==0) return 0;
*		if(n==1) return 1;
*		return product(n-1) + product(n-2);
*		}
* References: None.
*----------------------------------------------------------------------
*
product: EQU	$6000
        ORG     $0
        DC.L    $3000           * Stack pointer value after a reset
        DC.L    start           * Program counter value after a reset
        ORG     $3000           * Start at location 3000 Hex
*
*----------------------------------------------------------------------
*
#minclude /home/cs/faculty/riggins/bsvc/macros/iomacs.s
#minclude /home/cs/faculty/riggins/bsvc/macros/evtmacs.s
*
*----------------------------------------------------------------------
*
* Register use
*
*----------------------------------------------------------------------
*

start:  initIO                  * Initialize (required for I/O)
	setEVT			* Error handling routines
*	initF			* For floating point macros only	
	
	 
 lineout title		*print out class information
 lineout prompt1	*print prompt1
 linein  buffer		*take value from user asd save in buffer
 cvta2   buffer,D0	*Converts asscii to two;s complement and saves in buffer
 move.w  D0,-(SP)	*pushes D0 to the satck
 lineout prompt2	*print prompt2
 linein  buffer		*take value from user and save in buffer
 cvta2   buffer,D0	*Converts asscii to two;s complement and saves in buffer    
 move.w  D0,-(SP)	*pushed D0 to the stack 
 jsr     product	*puts the program counter at the strating address of product  
 adda.l  #4,SP    

 cvt2a   num,#15      
 stripp  num,#15	*pulls out the remainder
 lea     num,A0		*loads A0 in num 
 adda.l  D0,A0
 clr.b   (A0)
 lineout answer		*print the answer 
 


        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

title:    dc.b       'Pranav Kalra, Program #4, cssc1592',0
prompt1:  dc.b       'Enter the first integer',0
prompt2:  dc.b       'Enter the second integer',0
buffer:   ds.b        80
answer:   dc.b       'The product of the numbers are '
num:       ds.b        15
end
