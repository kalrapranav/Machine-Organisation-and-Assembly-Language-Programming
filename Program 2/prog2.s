*----------------------------------------------------------------------
* Programmer: Pranav Kalra
* Class Account: cscc1592
* Assignment or Title: Program 2 
* Filename: prog2.s
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
	initF			* For floating point macros only	

				* Your code goes HERE
	lineout		info		*Entering the inforamtion line 
	lineout		iniPay		*Promting user for intial payment (P)
	floatin		buffer1		*saving the user inpu in a buffer
	cvtaf		buffer1,D7	*converts users float value in ASCII and saving in D7

	lineout		monPay		*Asking user for montly deposit amount 	(p)	
	floatin		buffer2		*savig user's input in buffer 2
	cvtaf		buffer2,D6	*convertiing buffer 2's float value  in ASCII in D6 
 
	lineout		iniRat		*Asking user for initial Rate (r) 
	floatin		buffer3		*Saving rate in Buffer 3
	cvtaf		buffer3,D5	*Converting buffer3 from float to ASCII in D5

	lineout		numYea		*Asking user for number of years (t)
	floatin 	buffer4		*Saving years in buffer4
	cvtaf		buffer4,D4	*Converting buffer4 to ASCII in D4
	
	itof		#12,D3		*n=12 saved in D3
	itof		#1,D2		*D2=1
	itof		#1,D1		*D1=1

	fdiv		D3,D5		*D5 = r/n
	fadd		D5,D1		*D1 = 1 + r/n
	fmul		D3,D4		*D4 = n*t
	fpow		D1,D4		*D0 = (1 + r/n)^(n*t)
	move.l		D0,D4		*D4 = (1 + r/n)^(n*t)
	fmul		D4,D7		*D7 = p * (1 + r/n)^(n*t)

					*End of Eq 1 -----------------------
	fsub		D2,D4		*D4 = (1 + r/n)^(n*t) - 1
	fdiv		D5,D4		*D0 = ((1 + (r/n))^(n*t)/(r/n)
	move.l		D0,D4		*D4 = ((1 + (r/n))^(n*t)/(r/n)
	fmul		D1,D4		*D4 = ((1 + (r/n))^(n*t)/(r/n)*(1 + r/n)
	fmul		D4,D6		*D6 = p * ((1 + (r/n))^(n*t)/(r/n)*(1 + r/n)
	
	fadd		D7,D6
	
	move.l		D6,D0		*moving the final value to D0
	cvtfa		outVal,#2		
	lineout		outProm

        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

	
				* Your storage declarations go 
				
	info:		dc.b		'Pragram#2, Pranav Kalra, cssc1592',0
	iniPay:		dc.b		'Please enter the initial investment',0
	monPay:		dc.b		'Please enter the monthly deposit amount',0
	iniRat:		dc.b		'Please enter the annual interest rate in decimal',0
	numYea:		dc.b		'Please enter the number of years',0
	buffer1:	ds.b		80
	buffer2:	ds.b		80
	buffer3:	ds.b		80
	buffer4:	ds.b		80
	skipln:		dc.b		0
	outProm:	dc.b		'At the end of the given period your investment will be worth $'
	outVal:		ds.b		100
				* HERE

	
        end
