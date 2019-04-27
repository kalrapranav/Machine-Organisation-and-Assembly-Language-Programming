*----------------------------------------------------------------------
* Programmer: Pranav Kalra
* Class Account: cscc
* Assignment or Title: 
* Filename: prog3.s
* Date completed: April 23
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
 	initF			* For floating point macros only	

				* Your code goes HERE
	lineout		titleLine	*printing out the title line 
	lineout		skipln		*empty line

	
input:	lineout		intPrompt	*printing the input prompt
	linein		intInput	*to store user input in intInput
	stripp		intInput,D0	*
	move.l		D0,D2		*
	lea		intInput,D0	*
	tst.w		D2		*
	BEQ		invalid		*
	cmpi.w		#5,D2		*
	BHI		invalid		*
	move.w		D2,D4		*
	subq.w		#1,D4		*
	
loop: 	cmpi.b		#$30,(A0)	*
	BLO		invalid		*
	cmpi.b		#$39,(A0)+	*
	BHI		invalid		*
	*bra		loop		*
	dbra		D4,loop		*
	
	cvta2		buffer,D2	*
	move.l		D0,D4		*
	compi.l		#2,D4		*
	BLO		invalid		*
	cmpi.l		#65535,D4	*
	bgt		invalid		*
	lea		answer,A1	
	       


        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

				* Your storage declarations go 
				* HERE
				
	titleLine:	dc.b	'Program #3, Pranav Kalra, cssc1592',0
	intPrompt:	dc.b	'Enter an integer to factor (2..65535):',0
	skipln:		dc.b	0
	intInput:	ds.b	80
       
       
       
       
        end
