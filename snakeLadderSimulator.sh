#! /bin/bash -x

playerOnePosition=0
rollDice(){
	local roll=$((RANDOM%6+1))
	echo $roll
}
genPlayOptions(){
	local roll=$(rollDice)
	NO_PLAY=0
	LADDER=1
	SNAKE=2
	local option=$((RANDOM%3))
	local move=-1
	case $option in
		$NO_PLAY) 
			echo "NO_PLAY"
			move=0
			;;

		$LADDER) 
			echo "LADDER"
			move=$roll
			;;
		   
		$SNAKE)
			echo "SNAKE"
			move=-$roll
			;;
	esac
	echo $move
}
move=$(genPlayOptions)
echo $move
