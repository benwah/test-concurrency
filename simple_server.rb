require 'sinatra'
# require 'bundler/setup'

set :bind, '0.0.0.0'

get '/' do
  sleep(1)
  '/'
end

# Sinatra::Application.new
# # http_server.rb
# require 'socket'
# server = TCPServer.new 5678

# while session = server.accept
#   request = session.gets
#   puts request
#   sleep(1)
#   session.print "HTTP/1.1 200\r\n"
#   session.print "Content-Type: text/html\r\n"
#   session.print "\r\n"
#   session.print "Hello world! The time is #{Time.now}" #4

#   session.close
# end
