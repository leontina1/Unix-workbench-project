#!/bin/bash

declare -i numFiles
numFiles=$(( $(ls -l | wc -l) - 1 ))

function makeValidGuess {
	until read -p "Guess number of directories: " guess;
	[[ "$guess" =~ ^[0-9]+$ ]]; do
		echo -e "\nEnter an integer pls!\n"
	done
}

while makeValidGuess; do
	if (( guess < numFiles )); then
		echo -e "\nEnter bigger number."
	elif (( guess > numFiles )); then
		echo -e "\nEnter smaller number."
	else
		echo -e "\nCongratulations!"
		exit
	fi
done
