require 'sinatra'

get '/' do
  send_file File.join(settings.public_folder, 'hello.txt')
end
