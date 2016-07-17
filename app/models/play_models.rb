class Play

	def Play.getCurrentString(filename)
		currentString = ""
		file = File.open(filename, "r")
		file.each do |line|
			currentString << line
		end
		return currentString
	end

	def Play.makeBoardHash(currentString)
		boardHash = {}
		str = currentString
		str.split('|').each do |pair|
			key,value = pair.split(/:/)
			boardHash[key] = value
		end
		return boardHash
	end

	def Play.updateBoardHash(boardHash, whoseTurn, squareChosen)
		newHash = boardHash
		newHash[squareChosen] = whoseTurn
		return newHash
	end

	def Play.makeNewString(newHash)
		newString = newHash.map {|k,v| "#{k}:#{v}"}.join('|')+'|'
		return newString
	end

	def Play.writeNewString(filename, newString)
		i = newString
		newFile = File.open(filename, "w")
		newFile.print i
		newFile.close
	end

	def Play.whoseTurn(boardHash)
		whoseTurn = ""
		madePlays = boardHash.values
		xPlays = madePlays.count("X")
		oPlays = madePlays.count("O")
		if xPlays > oPlays
			whoseTurn = "O"
		elsif oPlays > xPlays
			whoseTurn = "X"
		else whoseTurn = "X"
		end
		return whoseTurn
	end

	def Play.resetNow(filename)
		j = "0: |1: |2: |3: |4: |5: |6: |7: |8: "
		resetFile = File.open(filename, "w")
		resetFile.print j
		resetFile.close
	end

	def Play.declareWinner(boardHash)
		winner = "no"
		i = boardHash.values
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

	def Play.declareTie(boardHash, winner)
		tie = "no"
		i = boardHash.values
		j = i.count(" ")
		if winner == "no" && j == 0
			tie = "yes"
		end
		return tie
	end

# This formula not currently in use. Will revisit in Story 5
	def Play.printSquares(boardHash, i)
		j = boardHash[i]
		if j == "X" 
			puts '<p>"X"</p>'
		elsif j == "Y"
			puts '<p>"Y"</p>'
		else puts '<button type="submit" name="squareChosen" value="#{j}"><%= @boardHash["#{j}"] %></button>'
		end
	end
end

# # command line tests
# x = Play.getCurrentString("boardstatus.txt")
# puts "string"
# puts x
# y = Play.makeBoardHash(x)
# puts "Hash before"
# puts y
# z = Play.updateBoardHash(y, "X", "1")
# puts "Hash after"
# puts z
# a = Play.makeNewString(z)
# puts "new string"
# puts a
# Play.writeNewString("boardstatus.txt", a)
# b = Play.whoseTurn(y)
# puts "whoseTurn"
# puts b
# c = Play.declareWinner(y)
# puts "winner?"
# puts c
# d = Play.printSquares(y, "1")
# puts "should just put x"

# e = Play.printSquares(y, "3")
# puts "should put button code"
# f = Play.declareTie(y, c)
# puts "tie?"
# puts f





