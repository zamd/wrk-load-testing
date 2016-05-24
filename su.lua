JSON = (loadfile "JSON.lua")() -- one-time load of the routines

local counter = 1
local emailTemplate = "user{n}@telco.com"
local passwordTemplate = "user{n}"
local headers = {}
local method = "POST"
local path = "/dbconnections/signup"

headers["Content-Type"]="application/json"

local body = {
    client_id = "iwT4FkzL81v6CAMYdSHO98xhRsbyyy9l",
    email = "",
    password = "",
    connection = "perf"
}

function setup(thread )
   thread:set("id", counter)
   counter = counter + 1
end

function init( args )
	--starting index for this thread... 
	index = (id-1) * args[1]
end

function request( ... )
	body.email = string.gsub(emailTemplate, "{n}", index)
	body.password = string.gsub(passwordTemplate, "{n}", index)
	index = index+1
	
	json = JSON:encode(body)
	--print(json)

	return wrk.format(method,path,headers,json)
end

-- function response(status, headers, body)
-- 	if status > 310 then
-- 		print(status)
-- 	end
-- end
