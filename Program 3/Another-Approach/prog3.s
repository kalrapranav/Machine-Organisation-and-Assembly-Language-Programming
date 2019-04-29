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
				
	lineout		progTitle		*printing program title
	lineout		skipLn			*skipping one line
	
*------This loop is for asking the value form user and storing it for use
WHILE:
	lineout		inLine			*printing input line
	linein		input			*storing userInput in input
	cvta2		input,#2
	move.b		input,D0		*moving user input to D0

						*check of the usr input is between 2..65535
	cmpi.b		#'2',D0
	blt		wrgInput
	*cmpi.b		#'65535',D0
	*bhi		wrgInput
	lineout		breakP

	move.b		D0,D1
FOR:
	lineout		hello
	addq		#1,D1
	bra		FOR
	
	
wrgInput:
	lineout		sorryLine
	bra		WHILE



        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

				* Your storage declarations go 
				
	progTitle:		dc.b		'Program #3, Pranav Kalra, cssc1592',0
	skipLn:			dc.b		0
	inLine:			dc.b		'Enter an integer to factor (2..65535):',0
	input:			ds.b		80
	sorryLine:		dc.b		' Sorry, your input is not a valid integer.',0
	breakP:			dc.b		'Break POint',0
	hello:			dc.b		'hello',0

	
	
	
        end
