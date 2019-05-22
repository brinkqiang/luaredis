
local redis = require "luaredis"
local HOST = "127.0.0.1"
local PORT = 6379

local conn = redis.connect(HOST, PORT)
local info = redis.unwrap_reply(conn:command("INFO"))
print(info)
conn:command("SET", "MYKEY", "hello world!")
local value = conn:command("GET", "MYKEY")
print(value)
