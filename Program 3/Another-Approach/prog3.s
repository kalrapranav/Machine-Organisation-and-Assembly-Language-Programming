*----------------------------------------------------------------------
* Programmer: 
* Class Account: 
* Assignment or Title: 
* Filename: 
* Date completed:  
*----------------------------------------------------------------------
* Problem statement:
* Input: 
* Output: 
* Error conditions tested: 
* Included files: 
* Method and/or pseudocode: 
* References: 
*----------------------------------------------------------------------
*
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

				* Your code goes HERE

	lineout		progTitle
	lineout		skipln	
	lineout		inputPrompt
	linein		buffer
	
	lea		buffer,A0
	
int_test:
	move.b		(A0)+,D1		* Load a digit from the number
	cmp.b		#48,D1
	blt		wrongIn
	lineout		success
	
	
skip:
	lineout		progTitle
	
wrongIn:
	lineout		skipln
	lineout		inputPrompt
	
	


				


        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

				* Your storage declarations go 
				* HERE
				
	progTitle:	dc.b		'Program #3, Pranav Kalra, cssc1592',0
	inputPrompt:	dc.b		'Enter an integer to factor (2..65535):',0
	buffer:		ds.b		80
	skipln:		dc.b		0
	success
	
	
	
        end
