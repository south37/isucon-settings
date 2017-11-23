local redis = require "resty.redis"
local red = redis:new()

red:set_timeout(1000)

local uri = ngx.var.request_uri
local ok, err = red:connect("13.113.191.11", 6379)
if not ok then
   ngx.say("failed to connect: ", err)
   return
end
local res, err = red:get(uri)
if not res then
   ngx.say("failed to get: ", error)
   return
end
if res == ngx.null then
  local res = ngx.location.capture("/proxy"..uri)
  ngx.header["Content-Type"] = res.header["Content-Type"]
  ngx.status = res.status
  ngx.say(res.body)
  return
end
ngx.say(res)
return
