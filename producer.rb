require 'rinda/rinda'
# Eric Wnorowski
# cs377
# Fall 2022
# Producer-Consumer v2
# Page 11 of Slides
# Professor Smith
# producer.rb
# Infinite loop producing
# data then depositing
# in the buffer.

URI = "druby://localhost:67671"
DRb.start_service
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, URI))

tag, n = ts.read( ["n", Numeric] )

while true do 
    tag, b = ts.take( ["empty"] )
        tag, rear = ts.take( ["rear", Numeric] )
        r = rand(100)
        ts.write( ["buf", rear, r] )
        rear = (rear + 1) % n
        ts.write( ["rear", rear] )
        puts "produced: #{r}"
        ts.write( ["full"] )
end
    