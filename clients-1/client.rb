require 'socket'

socket = TCPSocket.new('localhost', 2345)
while true do
  puts socket.gets
  sleep 2
  puts "Wow what a rude server... I'm going to say Sarah"
  sleep 2
  socket.puts "Sarah"
  sleep 1
  puts socket.gets
end
socket.close