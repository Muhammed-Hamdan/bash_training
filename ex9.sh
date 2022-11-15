#!/usr/bin/bash

# Illustration of switch case
read -p "Enter your choice" ch

case $ch in
	"1")
		echo "Choice one"
		;;
	"2")
		echo "Choice two"
		;;
	"3")
		echo "Choice three"
		;;
	*)
		echo "Not valid"
		;;
esac
