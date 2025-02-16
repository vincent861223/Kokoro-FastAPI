#!/bin/bash
# ./script/setup
# brew intall ffmpeg
cp com.kokoro-fastapi.plist ~/Library/LaunchAgents

# replace <PWD-VARIABLE>
sed -i '' -e 's|<PWD-VARIABLE>|'"$PWD"'|g' ~/Library/LaunchAgents/com.kokoro-fastapi.plist
sed -i '' -e 's|<HOME-VARIABLE>|'"$HOME"'|g' ~/Library/LaunchAgents/com.kokoro-fastapi.plist

launchctl load ~/Library/LaunchAgents/com.kokoro-fastapi.plist
