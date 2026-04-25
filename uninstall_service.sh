#!/bin/bash

launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.kokoro-fastapi.plist 2>/dev/null
rm -f ~/Library/LaunchAgents/com.kokoro-fastapi.plist
rm -rf "$HOME/Library/Application Support/Kokoro-FastAPI"
