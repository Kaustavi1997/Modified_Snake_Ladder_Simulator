#! /bin/bash -x

playerOnePosition=0
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
	fi	
	echo $current
}
playGame(){
	local countTurns=0
	local current=$1
	while [ $current -ne 100 ]
	do  
		current=$(movePlayer $current)
	done
	echo $current
	echo "Player wins!"
}
playGame $playerOnePosition
