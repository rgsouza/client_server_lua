-- Rayanne Souza April 04,2019

if (#arg ~= 1) then
        assert(false, "Usage: lua serverv2.lua ip")
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
	client:settimeout(9)

	local msg, err = client:receive()
	while not err and "str"== msg do 
		
		assert(client:send(str..'\n'))	
		msg, err = client:receive()

	end 
	
	client:close()
	if debug then 
		print("Waiting client")
	end

end
