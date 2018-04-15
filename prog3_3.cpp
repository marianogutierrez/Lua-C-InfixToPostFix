#include <stdio.h>
#include <string>
extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
}


int main(int argc, char* argv[]) {
char buff[256]; // allocated buffers
char tolua[256];
lua_State *L = luaL_newstate();
luaL_openlibs(L);
luaL_dofile(L,argv[1]);
// now retrieve from stdin

fgets(buff,256,stdin);
buff[strnlen(buff)-1] = "\0"; // null it cause appends newline
sprintf(tolua,"return InfixToPostfix(\"%s\")"", buff); // * auto terminated with null
luaL_dostring(L,tolua); // Lua please take this string and execute it


const char *output = luaL_checkstring(L,1); // 1 mean first arguement to whatever was being called
printf("%s\n", output);
lua_close(L); // always do this
return 0;
}
