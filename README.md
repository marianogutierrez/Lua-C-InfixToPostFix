Mariano Gutierrez
margutierrez75@gmail.com

## Included Files:
prog3_1.cpp
prog3_2.lua
prog3_3.cpp

## prog3_1
 Example Compile: g++ prog3_1.cpp – o prog3_1 – I lua - 5.3.4/src – L lua
  - This program sets up the Lua environment within c++ and
    executes the given Lua file fed through the command line.


## prog3_2
  This program incorporates the OOP concepts learned in class, specically those
  integrating support instancing in lua, and the usage of syntatic sugar such as
  orc:takeDamage(x) where the ":" implies that "self" is the first parameter
   Besides that the program makes use of a user created stack and queue with
   push,pop,enequeue, and dequeue. These are uses to implement the algorithim 
    for conversion from infix: 3 + 4 to post fix: 34+. 
    
    
   The psuedo is as follows :
          while(the output is not empty) 
              if(not operator)
                  enqueue
             else
         while(the operator selected is of equal or lesser precedence to the current op on the stack)
            enqueue the popped part of the stack
          end
           push op onto stack other wise
     finally
       pop everything off the stack and enqueue it 

## prog3_3
   This program is an extension of the first, and creates the Lua enironment and runs
   a given file from the command line. This time however sprintf is used 
   to put the input from stdin onto the buffer for lua to execute. 
   Afterwards, dostring is called for lua to execute the command and then checkstring is
   used to ensure the output was a string. Finally, the postfix statement is printed for all to see.
   
   # Compilation:
     ``` gcc prog3_3.c –o prog3_3 –I lua-5.3.4/src –L lua-5.3.4/src –l lua –l m –l dl ```
   # Execute: 
   ``` ./prog3_3 prog3_2.lua ```

