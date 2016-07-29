window.addEventListener("load", function(){
  var squares = document.querySelectorAll('button[name="squareChosen"]');
  var gameBoard = document.selectElementsByClassName("gameBoard__column");
  var winnerNotice = document.selectElementsByClassName("winnerNotice");
  var winner = document.selectElementsByClassName("winnerNotice__whichPlayer");
  var tieNotice = document.selectElementsByClassName("tieNotice");
  var turns = 0;
  var boardStatus = "000000000";
  var over = "no";

  for (var i = 0 ; i < squares.length ; i++) {
    squares[i].addEventListener("click", function(turns, boardStatus){
      var squareChosen = squares[i];
      whoseTurn(boardStatus);
      update_boardStatus(boardStatus, squareChosen, whoseTurn);
      if (turns > 4) {
        var check = new XMLHttpRequest();
        check.addEventListener("load", function(e){
          var response = JSON.parse(e.target.response);
          over = response.over;
        });
        check.open("get", "/boardForm" + boardStatus);
        check.send();
      }
      switch(over) {
        case "no":
          squares[i].innerHTML = whoseTurn;
          break;
        case "X":
          gameBoard.style.display = "none";
          winnerNotice.style.display = "block";
          winner.innerHTML = "X";
          break;
        case "O":
          gameBoard.style.display = "none";
          winnerNotice.style.display = "block";
          winner.innerHTML = "O";
          break;
        case "tie":
          gameBoard.style.display = "none";
          tieNotice.style.display = "block";
        break;
      }
      return turns ++;
    });
  }

  function whoseTurn(boardStatus){
    whoseTurn = "X";
    var xCount = (boardStatus.match(/X/g)||[]).length;
    var oCount = (boardStatus.match(/O/g)||[]).length;
    if (oCount > xCount) {
      whoseTurn = "O";
    }
    return whoseTurn;
  }

  function update_boardStatus(boardStatus, squareChosen, whoseTurn) {
    boardStatus[squareChosen] = whoseTurn;
    return boardStatus;
  }

debugger;     

});
 
