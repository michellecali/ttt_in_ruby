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
		newFile.puts i
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
		resetFile.puts j
		resetFile.close
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
# # Play.writeNewString("boardstatus.txt", a)
# b = Play.whoseTurn(y)
# puts "whoseTurn"
# puts b