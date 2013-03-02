require 'rubygems'
require 'em-http'

char = ARGV[0]

EventMachine.run do
  multi = EventMachine::MultiRequest.new

  1000.times do |i|
    multi.add i, EventMachine::HttpRequest.new("http://localhost:9292/#{char}").get
  end

  multi.callback do
    multi.responses[:callback].each do |name, request|
      unless request.response == char
        puts char
        raise "Found a bug!"
      end
    end
    EventMachine.stop
  end
end
