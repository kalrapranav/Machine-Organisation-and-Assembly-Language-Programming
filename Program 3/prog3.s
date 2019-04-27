*----------------------------------------------------------------------
* Programmer: 
* Class Account: 
* Assignment or Title: 	Program #3
* Filename: 		prog3.s
* Date completed:  	04/23/2019
*----------------------------------------------------------------------
* Problem statement:    Calculates the prime factors of a number
* Input:                Number to factor
* Output:               Prime factors
* Error conditions tested: Invalid numbers, invalid y/n answer
* Included files:       None
* Method and/or pseudocode: 
*
*    String getFactors(int number) {
*        String answer = "";
*        for(int factor=2; factor <= number; factor++) {
*            	if(number % factor == 0) {
*                answer += factor + "*";
*                number /= factor;
*                factor--;
*                }
*            }
*            return answer.substring(0, answer.length()-1);
*       }
* Sample Output:
*       Enter an integer to factor (2..65535):
*       14256
*       The factors of 14256 are:
*       2*2*2*2*3*3*3*3*11
* References:   None
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
*   D0 macro input/output, number when doing the factorization
*   D1 holds characters in test and copy loops, holds current factor 
*       in factorization part
*   D2 used as a temporary register
*   D3 used to hold quotient in factorization calculation
*   D4 used as temporary register
*   A0 used to hold several string addresses
*   A0 used to hold several string addresses
*----------------------------------------------------------------------
*

start:  
	initIO                  * Initialize (required for I/O)
	setEVT			* Error handling routines
*	initF			* For floating point macros only	

	lineout title		* Print the title
loop:
	lineout prompt		* Print the prompt
	linein  number		* Read the number as a string
	move D0,D2		* Save number of characters in D2

	lea number,A0		* Load number string start address in A0
	lea num_spc,A1		* Load answer string start address in A1
tst_loop:
    	move.b (A0)+,D1		* Load a digit from the number
    	cmp.b #48,D1		* compare with ascii '0'
    	blt not_valid		* if digit < '0' it's not a valid
    	cmp.b #57,D1		* compare with ascii '9'
    	bgt not_valid		* if digit > '9' it's not a valid
    	move.b D1,(A1)+		* Save digit in the answer string
	sub #1,D2		* Decrement number of characters to test
	bne tst_loop		* Repeat while the number of chars is not zero

	lea ans_end,A0		* Load ending string address in A0
cpy_loop:
	move.b (A0)+,D1		* Load character from string
    	move.b D1,(A1)+		* Save in the answer string
	cmp.b #0,D1		* See if we reached end of string
	bne cpy_loop		* Repeat loop

	move D0,D2		* Save number of characters in D2

	lineout ans_msg		* Print initial answer message	

	cvta2 number,D2		* Convert array to a number

	lea answer,A0		* Load answer start address in A0
	move.l #2,D1		* start using factor 2
factor:		
	clr.l D2		* set D2 to zero
	move.w D0,D2		* Get current number in D2
	divu.w D1,D2		* Divide number by factor
	move.w D2,D3		* Save quotient in D3
	and.l #$FFFF,D3		* clear upper part
	move.l #16,D4 		* value to shift register
	lsr.l D4,D2		* Move remainder to D2
	cmp.w #0,D2		* if remainder is zero
	bne next		* if not, use next factor
	
	move.l D1,D0		* put factor in D0
	cvt2a number,#5		* convert factor to array _------------
	stripp number,#5	* remove leading zeros

	lea number,A1		* point to start of converted number
copy:	
	move.b (A1)+,D4		* load a digit
	move.b D4,(A0)+		* copy to answer string
	sub.l #1,D0		* decrement number of digits
	bne copy		* repeat if not zero
	move.b #'*',(A0)+	* add a multiplication char

	move.l D3,D0		* Use quotient as the number for next iteration
	bra skip		* Use same factor again
next:	
	add.l #1,D1		* try next factor
skip:	
	cmp.l D0,D1		* compare factor with number
	ble factor		* repeat while factor <= number

	sub.l #1,A0		* decrement answer string pointer
	clr.b (A0)		* clear to remove last multiplication char

	lineout answer		* show answer

wait_ans:
	lineout ask_msg		* Ask if user wants to continue
	linein  ans_yn		* Read the answer
	lea ans_yn,A0		* Load answer start address in A0
    	move.b 0(A0),D1		* Load first char of answer
	cmp.b #'y',D1		* If the user entered y
	beq loop		* Restart loop
	cmp.b #'Y',D1		* If the user entered Y
	beq loop		* Restart loop
	cmp.b #'n',D1		* If the user entered n
	beq prog_end		* Terminate program
	cmp.b #'N',D1		* If the user entered N
	beq prog_end		* Terminate program
	lineout bad_msg		* Print an error message	
	bra wait_ans		* Prompt again for an answer

not_valid:
	lineout err_msg		* Print an error message	
	bra loop		* Prompt user for another number
prog_end:
	lineout end_msg		* Print ending message	
        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

title:		DC.B	'Program #3, Student Name, csscxxxx',0
prompt:		DC.B	'Enter an integer to factor (2..65535):',0
err_msg:	DC.B	'Sorry, your input is not a valid integer.',0
bad_msg:	DC.B	'Sorry, your input is not valid.',0
ask_msg:	DC.B	'Do you want to factor another integer (Y/N)?',0
end_msg:	DC.B	'Program terminated.',0
ans_msg:	DC.B	'The factors of '
num_spc:	DS.B	10
ans_end:	DC.B	' are:',0
number:		DS.B	10
ans_yn:		DS.B	2
answer:		DS.B	50
        end 

