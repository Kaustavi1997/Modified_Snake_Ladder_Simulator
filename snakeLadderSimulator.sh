#! /bin/bash -x

playerOnePosition=0
rollDice(){
	local roll=$((RANDOM%6+1))
	echo $roll
}
roll=$(rollDice)
echo $roll
