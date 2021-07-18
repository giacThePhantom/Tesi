#!/bin/sh
name=$(echo $1 | sed "s@.*/@@g")

fileid=$(gdrive list | grep "$name" | awk '{print $1}')

gdrive update "$fileid" $1
