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
				


        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

				* Your storage declarations go 
				* HERE
				
	progTitle:	dc.b		'Program #3, Pranav Kalra, cssc1592',0
	
	
	
        end
