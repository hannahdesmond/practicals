require 'socket'

server = TCPServer.new(2345)

socket = server.accept
while true do
  socket.puts "HELLO CLIENT WHAT IS YOUR NAME?"
  name = socket.gets.chomp
  sleep 3
  socket.puts "THAT'S A LOVELY NAME #{name}"
end
socket.close