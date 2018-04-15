

object = {}
function object:new(t)
  local obj = t or {}
  setmetatable(obj,self)
  self.__index = self
  return obj
end

-- globals
stack = {
    tok = {}
    len = 0 -- arrays however begin at one 
}
queue = {
    len = 0
    data = {}
    front = 1
} 

stk = object:new(stack)
q = object:new(queue)

----- STACK
function stack:push(x) -- 
    self.len = len + 1
    self.tok[len] = x
end

function stack:pop()
    if(self.len == 0) then
    print("No toks")
end
    local mytok = self.tok[self.len]
   table.remove(self.tok,len)  -- no need for return type apparently.
    self.len = self.len -1
    return mytok
end

function stack:peek()

  if(self.len == 0) then
    print("No toks")
end
    return self.tok[self.len] -- LIFO
end
------- QUEUE
function queue:enqueue(x) 
     self.data[self.len] = x
     len =len + 1
end


function queue:dequeue()
if(self.len == 0) then
    return nil
end
    local mytok = self.tok[front]
    table.remove(self.data,front); 
    self.len = self.len - 1
    return mytok

end

-- lower or equal precedence
function precedence(input,comp) {
    if(input == "(" or ")" and comp ==  "(" or ")"  then
        return true -- against itself
    else 
        return false; -- higher always

if (input == "*" or "/") then    
        if(comp == "(" or ")" or "*" or "/") then
            return true -- lower or equal
        else
            return false
elseif (input == "+" or "-") then
    if(comp ==  "(" or ")" or "*" or "/" or "+" or "-") then
    return true
       else return false
else
   return false -- nil 


function InfixToPostfix(str)
    
-- Tokenizes the input string by space, apply algo, and return postfix string
    local arg = str
for tok in arg: gmatch("%S") do -- splits it by the space 
    if( tok not( "(" or ")" or "*" or "/" or "+" or "-"))
        then -- must be a number
        q:enqueue(tok)
    else
        while(precedence(tok,stack.peek()) == true) do
            q:enqueue(stack.pop())
            stk:push(tok)
            end
    stk:push(tok)
end -- for / while not empty 
-- finally
while(stk.len not 0) 
    do
        q:enqueue(stk:pop())
end

local out = {}
 while(q.len not 0)
    do
        table.insert(out,q:dequeue())
end

return out
end -- end fucntion


