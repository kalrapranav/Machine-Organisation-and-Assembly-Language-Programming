
CS237 Spring 2019
Programming Assignment #3
125 points
Due Date/Time:
Your program will be due on Tuesday, April 16th at the beginning of class. For this assignment, the name of your source code file must be prog3.s.  As with previous assignments, you must place a copy of your source code file in your class account handin/ subdirectory for it to be graded.

The Assignment:
This assignment is designed to help you learn about flow control, branching, and looping in assembler.   You will write a program that prints the prime factors for any unsigned integer of size word.  
Details:

    Your program must print a title line, consisting of The assignment number, your name, and your class account, all on one line:
    Your program will accept as input only unsigned integers in the range 2 .. 65535.  If the user enters a value that is invalid, your program must print a helpful error message and prompt the user to enter a new integer.
    The cvta2 macro does no error checking.  Thus, you must write code to validate the input.    This is a major part of the assignment.   While implementation of this assignment in Java would be trivial, it is more difficult in assembler.   In particular, input validation will take some careful thought.
    Your program must be enclosed in a loop that asks the user if s/he wants to factor another integer.  Acceptable responses to this prompt are YyNn.  Any other input will result in an error message and the user will then be prompted again until s/he enters a valid response.  The title line should be printed only one time, and thus will not be in the body of the loop.
    Your program output should match the sample output given below, including the repetition of the number being factored in the answer line.  There should be no extraneous spaces in that line.
    Your program will calculate the prime factors for the input integer and print the answer in the following format:

    The factors of XXXX are:
    Factor_1*Factor_2*Factor_3 ...
    You must use the algorithm given below to determine the prime factors.


The Algorithm:

Below is a Java method. Given a valid number:

    String getFactors(int number) {
        String answer = "";
        for(int factor=2; factor <= number; factor++) {
            if(number % factor == 0) {
                answer += factor + "*";
                number /= factor;
                factor--;
                }
            }
            return answer.substring(0, answer.length()-1);
        }

Sample Output:

Program #3, John Student, csscxxxx

Enter an integer to factor (2..65535):
14256
The factors of 14256 are:
2*2*2*2*3*3*3*3*11

Do you want to factor another integer (Y/N)?
y

Enter an integer to factor (2..65535):
1207
The factors of 1207 are:
17*71

Do you want to factor another integer (Y/N)?
y

Enter an integer to factor (2..65535):
-25
Sorry, your input is not a valid integer.

Enter an integer to factor (2..65535):
25
The factors of 25 are:
5*5

Do you want to factor another integer (Y/N)?
n
Program terminated.

Note that the number to be factored is included within the body of the answer line, with a single space before and after.  Each factor is separated with a '*' character, with no additional spaces.
Grading:
Your program will be graded on correctness, reliability, and efficiency.  In particular loops, branches, and other flow control needs should be handled as efficiently as possible.  Extraneous instructions/branches may result in a lower grade for the assignment.   Be sure to document your program carefully.   As always,  your program must assemble without warnings or errors on rohan to receive any credit.  Also, please remember that collaboration between students on programming assignments is not permitted.   You must design and write your own program.  Any cheating will result in a failing grade for the course, and a referral to the Office of Judicial Procedures.
Late Programs:
Late programs will be accepted up to one week after the due date, with a penalty of 5% per day.
Cheating Policy

There is a zero tolerance policy on cheating in this course. You are expected to complete all programming assignments on your own. Collaboration with other students in the course is not permitted. You may discuss ideas or solutions in general terms with other students, but you must not exchange code. (Remember that you can get help from me or the TA.) I will examine your code carefully. Anyone caught cheating on a programming assignment or on an exam will receive an "F" in the course, and a referral to the Office for Student Rights and Responsibilities.
