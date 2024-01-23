require 'rinda/tuplespace'
# Eric Wnorowski
# cs377
# Fall 2022
# Producer-Consumer v2
# Page 11 of Slides
# Professor Smith
# server.rb
# Drb Server

URI = "druby://localhost:67671"
DRb.start_service(URI, Rinda::TupleSpace.new)
DRb.thread.join