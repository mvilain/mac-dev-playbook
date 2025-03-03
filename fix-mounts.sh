#!/bin/bash
for i in `df | awk '/com.apple.TimeMachine/{print $9}'`; 
  do echo $i 
  sudo diskutil unmount $i
done
exit
