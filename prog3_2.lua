
object = {} -- allow instancing with meta tables
function object:new(t)
  local obj = t or {}
  setmetatable(obj,self)
  self.__index = self
  return obj
end

-- globals
stack = { tok = {} ,len = 0 }
queue = { len = 0, data = {}, front = 1 }

stk = object:new(stack) -- make a new instance
q = object:new(queue) -- make a new instance

----- STACK
function stack:push(x) --
    self.len = self.len + 1
    self.tok[self.len] = x
end

function stack:pop()
    if(self.len == 0) then
    return
end
    local mytok = self.tok[self.len]
   table.remove(self.tok,self.len)  -- no need for return type apparently.
    self.len = self.len -1
    return mytok
end

function stack:peek() -- By peek I mean look at what remains in the stack

  if(self.len == 0) then
    return
end
    return self.tok[self.len] -- retrieve op to check
end
------- QUEUE
function queue:enqueue(x)
      self.len = self.len + 1
     self.data[self.len] = x
    -- self.len = self.len + 1
end


function queue:dequeue()
if(self.len == 0) then
    return nil
end
    local mytok = self.data[self.front]
    table.remove(self.data,self.front);
    self.len = self.len - 1
    return mytok

end

-- lower or equal precedence
function precedence(input,comp)
    if(input == "(" or input == ")" and comp ==  "(" or comp == ")")  then
        return true -- against itself

elseif (input == "*" or input == "/") then
        if(comp == "(" or comp == ")" or comp == "*" or comp == "/") then
            return true -- lower or equal
        else
            return false
          end

elseif (input == "+" or input =="-") then
    if(comp ==  "(" or comp == ")" or comp =="*" or comp == "/" or comp == "+" or comp == "-") then
    return true
       else return false
       end
end

end


function InfixToPostfix(str)

-- Tokenizes the input string by space, apply algo, and return postfix string
    local arg = str
    -- NOTE I could have a seperate function to tokenize the string but it does not interfere with the operation
    -- it may improve readability however. Then put a while loop for while the string is not empty
for tok in arg: gmatch("%S+") do -- splits it by the space NOTE NEEDS to be S+ otherwise not delineated by space!
    if(tok ~= "(" and tok ~=  ")" and tok ~=  "*" and tok ~=  "/" and tok ~=  "+" and tok ~=  "-")
        then -- must be a number
        q:enqueue(tok)
    else
        while(precedence(tok,stk:peek()) == true) do
            q:enqueue(stk:pop()) -- pop the operator off the stack and enqueue it
            end
    stk:push(tok)
end
end
-- finally
while(stk.len ~= 0)
    do
        q:enqueue(stk:pop())
end

local out = {}
 while(q.len ~= 0)
    do
        table.insert(out,q:dequeue())
end
a = ""
 for i = 1, #out do
   a = a..out[i]
   a = a.." " -- space it out
end
return a
 end
