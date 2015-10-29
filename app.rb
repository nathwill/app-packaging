require 'sinatra'

get '/' do
  "the time where this server lives is #{Time.now}"
end
