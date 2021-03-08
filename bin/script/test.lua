
function bin2hex(s)
    s = string.gsub(s,"(.)",function (x) return string.format("%02X ",string.byte(x)) end)
    return s
end

local redis = require "luaredis"
local HOST = "127.0.0.1"
local PORT = 6379

local conn = redis.connect(HOST, PORT, 5)
if conn == nil then
  print("connect failed")  
  return 
end

local ok = redis.unwrap_reply(conn:command("AUTH", "123456"))

if ok == nil then
    print("AUTH reply: nil, type: nil")
elseif ok == "OK" then
    print("AUTH reply: " .. ok .. " type: " .. type(ok))
else
    print("AUTH reply: " .. ok .. " type: " .. type(ok))
    return
end

local info = redis.unwrap_reply(conn:command("INFO"))
print(info)

local ret = conn:command("HSET","myhash", "MYKEY", "hello\0 world!")

local value = conn:command("HGET", "myhash", "MYKEY")
print(bin2hex(value))
