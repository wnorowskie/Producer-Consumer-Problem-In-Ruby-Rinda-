require 'rinda/rinda'
# Eric Wnorowski
# cs377
# Fall 2022
# Producer-Consumer v2
# Page 11 of Slides
# Professor Smith
# init-ts.rb
# Initialize tuple space


# Connect to tuple space
URI = "druby://localhost:67671"
DRb.start_service
ts = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, URI))

# initialize tuple space
#   int buf[n];
#   int n;
#   int front;
#   int rear;
#   int full;
#   sem empty = n;

ts.write( ["n", 20] )
ts.write( ["front", 0] )
ts.write( ["rear", 0] )

i = 0
while i<20 do
    ts.write( ["empty"] )
    i += 1
end

puts "init-ts: tuple space initialized..."