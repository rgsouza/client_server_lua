-- Rayanne Souza April 04,2019

if (#arg ~= 1) then
	assert(false, "Usage: lua server.lua ip")
end

local socket = require("socket")
IP = arg[1]
PORT = 5500

local server = assert(socket.bind(IP, PORT))

print("ip:",IP,"port:",PORT)

debug = false
str = string.rep("a", 2^10)

while 1 do

	local client = server:accept()
	local msg, err = client:receive()

	if debug then 
		print("Received message:",msg)
		print("Error:",err)
	end

	if msg == "str" and err == nil then 
		assert(client:send(str .. '\n'))
	else
		print("Error in received message")
	end

	client:close()
	if debug then  
		print("Waiting client")
	end
	
end
