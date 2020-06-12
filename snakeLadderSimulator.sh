#! /bin/bash 

playerOnePosition=0
playerTwoPosition=0

rollDice(){
	local roll=$((RANDOM%6+1))
	echo $roll
}
generatePlayOptions(){
	local NO_PLAY=0
	local LADDER=1
	local SNAKE=2
	local roll=$(rollDice)
	local option=$((RANDOM%3))
	local move=-1
	case $option in
		$NO_PLAY) 
			move=0
			;;

		$LADDER) 
			move=$roll
			;;
		   
		$SNAKE)
			move=-$roll
			;;
	esac
	echo $move
}
movePlayer(){
	local current=$1
	local currentInit=$current
	local move=$(generatePlayOptions)
	current=$(($current+$move))
	if [ $current -lt 0 ]
	then
		current=0
	elif [ $current -gt 100 ]
	then
		current=$currentInit
	fi	
	echo $current
}
onePlayerGame(){
	local countTurns=0
	local current=$1
	while [ $current -ne 100 ]
	do  
		current=$(movePlayer $current)
		echo $current
		countTurns=$(($countTurns+1))
	done
	echo "Player wins!"
	echo $countTurns
}
twoPlayerGame(){
	local player1=$1 
	local player2=$2
	while [ $player2 -ne 100 ]
	do  
		player1=$(movePlayer $player1)
		echo "Player1 position = $player1"
		if [ $player1 -eq 100 ]
		then
			break
		fi
		player2=$(movePlayer $player2)
		echo "Player2 position = $player2"
	done
	if [ $player1 -eq 100 ]
	then
		echo "Player1 wins"
	else
		echo "Player2 wins"
	fi
}
twoPlayerGame $playerOnePosition $playerTwoPosition
