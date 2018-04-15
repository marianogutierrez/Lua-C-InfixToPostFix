#include <stdio.h>
#include "lua.h" // connect
#include "lualib.h"
#include <stdlib.h>
#include <iostream>
#include "luaxlib.h" // lua auxiallry  NOTE: L AUX
// C is the host and thus defines everything
// g++ prog3_1.cpp – o prog3_1 – I lua - 5.3.4/src – L lua - 5.3.4/src – l lua – l m – l dl


/*This program will take in a single command line arg
which will be a Lua file and then execute it. */
int main(int argc, char *argv[]) {
  if(argc != 2) { // program counts as an arguement NOTE: starts at zero
    std::cout << std::endl;
    std::cout << "This program expects a single command line argument." << std::endl;
    return 1; // end it; the user broke my stuff
  }

    lua::lua_State *L = luaL_newstate(); // newState makes compiler mad, bc cant link
     // allocate lua stack on the heap auxilalary lib
  lua::  luaL_openlibs(L); // puts things inside box for Lua to use
  lua::  luaL_dofile(L,argv[1]);
  lua::  luaL_close(L); // always do this
    return 0;
  }
