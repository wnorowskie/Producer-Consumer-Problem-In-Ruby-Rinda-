require 'rinda/rinda'
# Eric Wnorowski
# cs377
# Fall 2022
# Producer-Consumer v2
# Page 11 of Slides
# Professor Smith
# consumer.rb
# Infinite loop fetching data
# from the buffer and consuming.

URI = "druby://localhost:67671"
DRb.start_service
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, URI))

tag, n = ts.read( ["n", Numeric] )

while true do
    ts.take( [ "full" ] )
        tag, front = ts.take( ["front", Numeric] )
        tag, f, res = ts.take( ["buf", front, Numeric] )
        puts "Number #{front} consumed: #{res}"
        front = (front + 1) % n
        ts.write( ["front", front] )
        ts.write( [ "empty" ])
end
    