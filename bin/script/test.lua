
function bin2hex(s)
    s=string.gsub(s,"(.)",function (x) return string.format("%02X ",string.byte(x)) end)
    return string.gsub(s,"(.)",function (x) return string.format("%02X ",string.byte(x)) end)
end

local redis = require "luaredis"
local HOST = "127.0.0.1"
local PORT = 6379

local conn = redis.connect(HOST, PORT)
local ok = redis.unwrap_reply(conn:command("AUTH", "123456"))
print("AUTH reply: ")
print(bin2hex(ok))
print(ok)
if ok == "OK" then
    print("AUTH NG.")
    return
end
print("AUTH OK.")

local info = redis.unwrap_reply(conn:command("INFO"))
print(info)
conn:command("SET", "MYKEY", "hello world!")
local value = conn:command("GET", "MYKEY")
print(value)
