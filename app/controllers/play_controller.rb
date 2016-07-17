MyApp.get "/" do
  @current_page = "Tic Tac Toe"
  @currentString = Play.getCurrentString("boardstatus.txt")
  @boardHash = Play.makeBoardHash(@currentString)
  @whoseTurn = Play.whoseTurn(@boardHash)
  @winner = Play.declareWinner(@boardHash)
  @tie = Play.declareTie(@boardHash, @winner)
  binding.pry
  if @winner != "no"
    erb :"/winner"
  elsif @tie != "no"
    erb :"/tie"
  else
	  erb :"/boardForm"
  end
end

MyApp.post '/boardForm' do
  @currentString = Play.getCurrentString("boardstatus.txt")
	@boardHash = Play.makeBoardHash(@currentString)
  @whoseTurn = params['whoseTurn']
  @squareChosen = params['squareChosen']
  x = Play.updateBoardHash(@boardHash, @whoseTurn, @squareChosen)
  y = Play.makeNewString(x)
  Play.writeNewString("boardstatus.txt", y)

  redirect '/'
end

MyApp.post '/reset' do
  Play.resetNow("boardstatus.txt")
  redirect '/'
end


# MyApp.get "/play/:whoseTurn/:boardStatus/:totalScore" do
# 	code
# end

