

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

stack = object:new(stack)
queue = object:new(queue)

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
   -- self.data.remove()  -- no need for return type apparently.
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
     back = len + 1
end


function queue:dequeue()
if(self.len ==0) then
    print("nada)
end
    local mytok = self.tok[front]
    --self.data.table.remove(front); 
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
    if(comp ==  "(" or ")" or "*" or "/" or "+") then
    return true
       else return false

else
   return false -- nil 


function InfixtoPostfix(str)
    
-- Tokenizes the input string by space, apply algo, and return postfix string
    local arg = str
for tok in arg: gmatch("%S") do -- splits it by the space 
    if( tok not( "(" or ")" or "*" or "/" or "+" or "-"))
        then -- must be a number
        queue.enqueue(tok)
    else
        while(precedence(tok,stack.peek()) == true) do
            queue.enqueue(stack.pop())
            end
    stack.push(tok)
end -- for / while not empty 
-- finally
while(stack.len not 0) 
    do
        queue.enqueue(stack.pop)
end

local out = {}
 while(queue.len not 0)
    do
        table.insert(out,queue.dequeue())
end

return out
end -- end fucntion


