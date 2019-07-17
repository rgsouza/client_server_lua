-- Rayanne Souza April 04,2019 

if (#arg ~= 2) then 
	assert(false, "Usage: lua clientv2.lua ip nRequests")
end


local socket = require("socket")
host = arg[1]
nRequests = arg[2]
port = 5500

print(host, port)

tcp = assert(socket.connect(host, port))

debug = false

t1 = socket.gettime()
for i=1,nRequests,1 do

	tcp:send("str\n")
	
    	local s, status, partial = tcp:receive()
	
	if debug then
		print("string size",string.len(s))
		print("status:",status)
		print("partial",partial)
		print("i:",i)
	
	end

	assert(string.len(s) == 1024, "Error in received string")
end
tcp:close()

t2 = socket.gettime()
print("Time elapsed (s):", t2 - t1) 

