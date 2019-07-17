-- Rayanne Souza April 04,2019 

if (#arg ~= 2) then
        assert(false, "Usage: lua client.lua ip nRequests")
end

local socket = require("socket")
host = arg[1]
n = arg[2]
port = 5500

print(host, port)
debug = false

t1 = socket.gettime()
for i=1, n, 1
do
	tcp = assert(socket.connect(host, port))
	
	tcp:send("str\n")

	local s, status, partial = tcp:receive()

	if debug then 
		print("string size",string.len(s))
		print("status:",status)
		print("partial",partial)
		print("i:",i)
	end

	assert(string.len(s) == 1024, "Error in received string")
	tcp:close()

end

t2 = socket.gettime()
print("Time elapsed (s):", t2 - t1)
