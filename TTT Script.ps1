$CurrentPlayer = "X","O" | Get-Random
[System.Collections.arrayList]$TicTacToeBoard = @(1,2,3,4,5,6,7,8,9)
$GameOver = $false

function DisplayBoard {
   param ($Board)
   Write-Host " $($Board[0]) | $($Board[1]) | $($Board[2]) "
   Write-Host "---+---+---" 
   Write-Host " $($Board[3]) | $($Board[4]) | $($Board[5]) "
   Write-Host "---+---+---"
   Write-Host " $($Board[6]) | $($Board[7]) | $($Board[8]) "
   Write-Host 
}

do {
 do {
    DisplayBoard -Board $TicTacToeBoard
  do {
     $choice = Read-Host -Prompt "Player $CurrentPlayer, please choose your spot"
     $GoodSpots = @(1,2,3,4,5,6,7,8,9)
     if ($TicTacToeBoard -contains $choice -and $GoodSpots -contains $choice) {$TryAgain = $false}
     else {$tryAgain = $true}
    } while ($tryAgain -eq $true) 
  $TicTacToeBoard[$choice - 1] = $CurrentPlayer

  $winninglines = @(
     @(0,1,2),
     @(3,4,5),
     @(6,7,8),
     @(0,3,6),
     @(1,4,7),
     @(2,5,8),
     @(0,4,8),
     @(2,4,6)
    )
    foreach ($winningline in $winninglines) {
        $PositionValues = ($TicTacToeBoard[$winningline] | select-object -Unique)
        if ($PositionValues.count -eq 1) {
            $GameOver = $true
            break
    }
   }
   if ($Gameover -eq $false) {
        if($CurrentPlayer -eq 'X') {$CurrentPlayer = 'O'}
        else {$Currentplayer = 'X'}
  }
 } until ($GameOver -eq $true)
 DisplayBoard -Board $TicTacToeBoard
 Write-Host "Player $CurrentPlayer, you are the winner"
} while ($keepPlaying)
