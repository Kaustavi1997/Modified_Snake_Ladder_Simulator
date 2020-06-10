#! /bin/bash -x

playerOnePosition=0
playerTwoPosition=0
NO_PLAY=0
LADDER=1
SNAKE=2
rollDice(){
	local roll=$((RANDOM%6+1))
	echo $roll
}
genPlayOptions(){
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
	local move=$(genPlayOptions)
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
playGame(){
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
playGameForTwoPlayers(){
	local currentP1=$1
	local currentP2=$2
	while [ $currentP1 -ne 100 -a $currentP2 -ne 100 ]
	do  
		currentP1=$(movePlayer $currentP1)
		echo "Player1 pos = $currentP1"
		if [ $currentP1 -eq 100 ]
		then
			break
		fi
		currentP2=$(movePlayer $currentP2)
		echo "Player2 pos = $currentP2"
	done
	if [ $currentP1 -eq 100 ]
	then
		echo "Player1 wins"
	else
		echo "Player2 wins"
	fi
}
playGameForTwoPlayers $playerOnePosition $playerTwoPosition
