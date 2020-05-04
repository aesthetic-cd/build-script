#!/bin/bash
echo "Welcome to the new software build!"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version

echo "Would you like to continue? (Enter '1' for yes and '0' for no.)"
read versioncontinue

if [ $versioncontinue -eq 1 ]
 then
  echo "OK"
  for filename in source/*
  do
    echo $filename
  done
  if [ "$filename" == "source/secretinfo.md" ]
  then
    echo "Not copying" $filename
  else
    echo "Copying" $filename
    cp $filename build/.
  fi
  cd build/
  #We'll add more code here later
  echo "Build version $version contains:"
  ls
 else
  echo "Please come back when you are ready."
fi