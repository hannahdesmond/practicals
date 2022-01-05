# Sockets​ ​ are​ ​ the​ ​ endpoints​ ​ of​ ​ the​ ​ communication​ ​ channel
# Both​ ​ clients​ ​ and​ ​ servers​ ​ have to​ ​ use​ ​ sockets​ ​ 
# to​ ​ communicate.
require 'socket'

# this line creates a new connection to a local host on port 2345.
server = TCPServer.new(2345)

# call to open the connection?
socket = server.accept

while true do

  socket.puts "What do you say?"

  they_said = socket.gets.chomp

  break if they_said == "quit"

  socket.puts "You said: #{they_said}. Goodbye!"

end

socket.close

=begin
TCP has the "three-way handshake", which is more like:

I would like a sugar packet

I heard you ask for a sugar packet

I did ask for a sugar packet

Here's the sugar  

TCP is built on

Network Layer connection = how are we physically transporting this sugar
Internet Layer = Who is exchanging this sugar
Transport Layer = Which cup is this sugar going to

Network layer = responsible for physically transporting this data which is (e.g)
someone walking over or even throwing over the sugar to the person that is requesting it.
This can come in many forms such as ethernet or wifi(simplified). Are you throwing the sugar or are you physically walking there.

Internet Layer = You need to know where these packages are going, These layers usually have frames that contain destination IP and source IPs.
The source IP would be where the packet or sugar is coming from(which person) and where the packet should go destination IP(where the sugar is going)
This would be from a host to host level, we do not know which of the cups the sugar is going into

Transport Layer = Imagine the person asking for the sugar has got three cups. We need to know which cup the sugar is going into. for this purpose we describe the cups as having their port addresses.
Putting the sugar into the designated cup would be transporting from an process to process level transportation.

Transport layer will have different methods of transporting the sugar as it was mentioned. Which would be where I would reference the first comment posted of UDP vs TCP
=end