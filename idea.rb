require "sinatra"

get '/' do send_file "index.html" end
get '/remindernotes' do send_file "remindernotes.html" end
get '/contactsync' do send_file "contactsync.html" end
get '/jukeboxupdate' do send_file "jukeboxupdate.html" end
