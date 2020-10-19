#!/bin/bash
# Create a repo called "history_saver"
# Clone to whatever machine you want to save history of
# Run this script. I set it as an alias on my machine so I can just type 'hist'
# Optimally, you'd run this as a chron job, but some clusters don't allow that
# Shoot me a PR if you have any good ideas for this one.

cd ~/history_saver
today_date=$(date +'%Y/%m')
mkdir -p $today_date
today_name=$(date +'%d')
history >> ~/history_saver/${today_date}/${today_name}.txt
git add ~/history_saver/* -A
git commit -m "Updating history for ${today_date}/${today_name}.txt"
git push