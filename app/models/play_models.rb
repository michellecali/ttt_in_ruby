class Play

	def Play.declareWinner(boardStatus)
		winner = "no"
		i = boardStatus
		win = Array.new
		win[0] = i[0] + i[1] + i[2]
		win[1] = i[3] + i[4] + i[5]
		win[2] = i[6] + i[7] + i[8]
		win[3] = i[0] + i[3] + i[6]
		win[4] = i[1] + i[4] + i[7]
		win[5] = i[2] + i[5] + i[8]
		win[6] = i[0] + i[4] + i[8]
		win[7] = i[2] + i[4] + i[6]
		win.each do |j|
			if j=="XXX" 
				winner = "X"
			elsif j=="OOO"
				winner = "O"
			end
		end
		return winner
	end

	def Play.declareTie(boardStatus)
		tie = "no"
		i = boardStatus
		j = i.count("0")
		if j == 0
			tie = "tie"
		end
		return tie
	end

	def Play.setOver(winner, tie)
		over = "no"
		if winner != "no"
			over = winner
		elsif tie != "no"
			over = tie
		end
		return over
	end


