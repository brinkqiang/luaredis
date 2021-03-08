# luaredis

Copyright (c) 2013-2018 brinkqiang (brink.qiang@gmail.com)

[![luaredis](https://img.shields.io/badge/brinkqiang-luaredis-blue.svg?style=flat-square)](https://github.com/brinkqiang/luaredis)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/brinkqiang/luaredis/blob/master/LICENSE)
[![blog](https://img.shields.io/badge/Author-Blog-7AD6FD.svg)](https://brinkqiang.github.io/)
[![Open Source Love](https://badges.frapsoft.com/os/v3/open-source.png)](https://github.com/brinkqiang)
[![GitHub stars](https://img.shields.io/github/stars/brinkqiang/luaredis.svg?label=Stars)](https://github.com/brinkqiang/luaredis) 
[![GitHub forks](https://img.shields.io/github/forks/brinkqiang/luaredis.svg?label=Fork)](https://github.com/brinkqiang/luaredis)

## Build status
| [Linux][lin-link] | [MacOSX][osx-link] | [Windows][win-link] |
| :---------------: | :----------------: | :-----------------: |
| ![lin-badge]      | ![osx-badge]       | ![win-badge]        |

[lin-badge]: https://travis-ci.org/brinkqiang/luaredis.svg?branch=master "Travis build status"
[lin-link]:  https://travis-ci.org/brinkqiang/luaredis "Travis build status"
[osx-badge]: https://travis-ci.org/brinkqiang/luaredis.svg?branch=master "Travis build status"
[osx-link]:  https://travis-ci.org/brinkqiang/luaredis "Travis build status"
[win-badge]: https://ci.appveyor.com/api/projects/status/github/brinkqiang/luaredis?branch=master&svg=true "AppVeyor build status"
[win-link]:  https://ci.appveyor.com/project/brinkqiang/luaredis "AppVeyor build status"

## env
install cmake

## Intro
luaredis

win
```lua
cd bin/relwithdebinfo
lua ../script/test.lua
```

linux
```lua
cd bin/relwithdebinfo
lua ../script/test.lua
```

```lua
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
local ret = conn:command("SET", "MYKEY", "hello world!")
print(ret)
local value = conn:command("GET", "MYKEY")
print(value)
```

## Contacts
[![Join the chat](https://badges.gitter.im/brinkqiang/luaredis/Lobby.svg)](https://gitter.im/brinkqiang/luaredis)

## Thanks
