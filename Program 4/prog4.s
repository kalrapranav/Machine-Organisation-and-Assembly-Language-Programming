051075**----------------------------------------------------------------------
* Programmer: Pranav Kalra
* Class Account: cssc1377
* Assignment or Title: Assigment 4
* Filename: prog3.s
* Date completed: 05/12/19 
*----------------------------------------------------------------------
* Problem statement: enter a item number to give out a price for the item number
* Input: a number 
* Output: the price of that number 
* Error conditions tested: input one single natural number up to five digit 
* Included files: N/A
* Method and/or pseudocode: the program will ask a user for a single number up to five digit. The *array of the integer will point the item price on that number and will print that price.
* References: Marc
*----------------------------------

*------------------------------------
*
        ORG     $0
        DC.L    $3000           * Stack pointer value after a reset
        DC.L    start           * Program counter value after a reset
        ORG     $3000           * Start at location 3000 Hex
*
*----------------------------------------------------------------------
*
#minclude /home/cs/faculty/cs237/bsvc/macros/iomacs.s
#minclude /home/cs/faculty/cs237/bsvc/macros/evtmacs.s
*
*----------------------------------------------------------------------
*
* 
*----------------------------------------------------------------------
*
start:  
initIO                  * Initialize (required for I/O)
setEVT* Error handling routines
*initF* For floating point macros only

gcd:EQU$7000


lineout tittle
lineout prompt
lineininput

leainput,A0
        clr.lD3
nul:
cmpi.b#' ',(A0)
beqprint
adda.l#1,A0
branul

print:
move.lA0,D1
subD2,D1
sub.lD1,A0
cvta2(A0),D1
add.lD1,D0
move.lD0,D3
cmpi.b#0,D0
beqend
add.l#1,A0
move.lA0,A1
move.lA1,D2
clr.wD3


end:
cvt2aout2,#8
strippout2,#8
move.lA0,A2
adda.lA2,A1
leaout2,A1
adda.lD0,A1
move.b#'.',(A1)+
clr.b(A1)
        
lineoutout1


break


*
*----------------------------------------------------------------------
*       Storage declarations
*My Storage declaration goes here

tittle: dc.b    'Program #4, Mehul Sompura, cssc1377',0
prompt: dc.b    'Enter two numbers separated by a space: ',0
input:ds.b80
out1:dc.b'Their GCD is '
out2:ds.b80
        end
