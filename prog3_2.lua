object = {}
function object:new(t)
  local obj = t or {}
  setmetatable(obj,self)
  self.__index = self
  return obj
end

-- globals
stack = { tok = {} ,len = 0 }
queue = { len = 0, data = {}, front = 1 }

stk = object:new(stack)
q = object:new(queue)

----- STACK
function stack:push(x) --
    self.len = self.len + 1
    self.tok[self.len] = x
end

function stack:pop()
    if(self.len == 0) then
    print("No toks")
    return
end
    local mytok = self.tok[self.len]
   table.remove(self.tok,self.len)  -- no need for return type apparently.
    self.len = self.len -1
    return mytok
end

function stack:peek()

  if(self.len == 0) then
    print("No toks")
    return
end
    return self.tok[self.len] -- LIFO
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
    else
        return false; -- higher always
    end
if (input == "*" or "/") then
        if(comp == "(" or ")" or "*" or "/") then
            return true -- lower or equal
        else
            return false
          end
elseif (input == "+" or "-") then
    if(comp ==  "(" or ")" or "*" or "/" or "+" or "-") then
    return true
       else return false
       end
else
   return false -- nil
end
end

function InfixToPostfix(str)

-- Tokenizes the input string by space, apply algo, and return postfix string
    local arg = str
for tok in arg: gmatch("%S") do -- splits it by the space
    if(tok ~= "(" and tok ~=  ")" and tok ~=  "*" and tok ~=  "/" and tok ~=  "+" and tok ~=  "-")
        then -- must be a number
        q:enqueue(tok)
    else
        while(precedence(tok,stk:peek()) == true) do
            q:enqueue(stk:pop())
            stk:push(tok)
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

return out
 -- thought this was the for loop
 end
