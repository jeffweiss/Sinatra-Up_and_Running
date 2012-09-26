require 'sinatra/base'
Dir.glob('./{helpers,controllers}/*.rb').each { |file| require file }

map('/example') { run ExampleController }
map('/') { run ApplicationController }