
local redis = require "luaredis"
local HOST = "192.168.1.33"
local PORT = 6379

local conn = redis.connect(HOST, PORT)
local info = redis.unwrap_reply(conn:command("INFO"))
print(info)
