#!/bin/bash
# ./script/setup
# brew install ffmpeg

APP_SUPPORT_DIR="$HOME/Library/Application Support/Kokoro-FastAPI"
mkdir -p "$APP_SUPPORT_DIR"
cp start-cpu.sh "$APP_SUPPORT_DIR/start-cpu.sh"
chmod +x "$APP_SUPPORT_DIR/start-cpu.sh"

cp com.kokoro-fastapi.plist ~/Library/LaunchAgents/

# replace placeholder variables
sed -i '' -e 's|<PWD-VARIABLE>|'"$PWD"'|g' ~/Library/LaunchAgents/com.kokoro-fastapi.plist
sed -i '' -e 's|<HOME-VARIABLE>|'"$HOME"'|g' ~/Library/LaunchAgents/com.kokoro-fastapi.plist
sed -i '' -e 's|<APP-SUPPORT-VARIABLE>|'"$APP_SUPPORT_DIR"'|g' ~/Library/LaunchAgents/com.kokoro-fastapi.plist

launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.kokoro-fastapi.plist
