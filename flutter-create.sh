#!/bin/bash

intro() {
	var=$1
	if [ $var -eq 1 ];
	then
		echo ""
		echo "flutter create started"
		echo ""
	fi

	if [ $var -eq 2 ];
	then
		echo ""
		echo "creating..."
		slp 2
		echo ""	
	fi
}

slp() { 
	var=${1:-1}
	sleep $var 
}

overview() {
	echo "project-name: $1"
	slp
	echo "description: $5"
	slp
	echo "directory: $2"
	slp
	echo "org: $3"
	slp
	echo "platforms: $4"
}

proceed() {
	echo ""
	read -p "proceed(Y/n): " proceed
	echo ""

	if [ $proceed = "n" ];
	then
		echo "closing..."
		slp 1
		exit -1
	fi
}

checkifsuccess() {
	if [ $# -ne 0 ];
	then
		echo ""
		echo "something went wrong."
		echo ""
	fi
}

intro 1

read -p "--description: " description
read -p "--project-name: " project

intro 2

directory="project-$project"
org='com.emma_ea'
platforms='android,ios'

overview $project $directory $org $platforms $description

proceed

flutter create --description "$description" --org $org --project-name $project --platforms $platforms $directory

checkifsuccess

