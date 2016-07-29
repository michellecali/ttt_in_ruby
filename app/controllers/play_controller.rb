MyApp.get "/" do
  erb :"/boardForm"
end

MyApp.get '/boardForm/:boardStatus' do
  @boardStatus = params['boardStatus']
  @winner = Play.declareWinner(@boardStatus)
  @tie = Play.declareTie(@boardStatus)
  @over = Play.setOver(@winner, @tie)
  require 'json'
  return JSON.generate(@over)
  erb :"/boardForm"
end

MyApp.post '/reset' do
  redirect '/boardForm'
end


