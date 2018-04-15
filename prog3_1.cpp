// Allows use of C header files with c++
#include <stdio.h>
extern "C" {
#include "lua.h" // connect
#include "lualib.h"
#include "lauxlib.h" // lua auxiallry  NOTE: L AUX
}
// C is the host and thus defines everything
// g++ prog3_1.cpp – o prog3_1 – I lua - 5.3.4/src – L lua - 5.3.4/src – l lua – l m – l dl


/*This program will take in a single command line arg
which will be a Lua file and then execute it. */
int main(int argc, char *argv[]) {
  if(argc != 2) { // program counts as an arguement NOTE: starts at zero
    printf("\n");
    printf("This program expects a single command line argument.\n");
    return 0; // end it; the user broke my stuff
  }
  printf("Assignment #3-1, Mariano Gutierrez, margutierrez75@gmail.com\n");

  lua_State *L = luaL_newstate(); // newState makes compiler mad, bc cant link
     // allocate lua stack on the heap auxilalary lib
   luaL_openlibs(L); // puts things inside box for Lua to use
   luaL_dofile(L,argv[1]);
   lua_close(L); // always do this
    return 0;
  }
