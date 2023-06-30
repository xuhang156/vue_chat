#!/bin/bash

LOCAL_REPO_PATH="/var/www/html/vue_chat"
REMOTE_REPO_URL="git@github.com:xuhang156/vue_chat.git"

while true; do
    cd "$LOCAL_REPO_PATH"
    git pull
    sleep 60 # 每隔60秒检测一次
    
    git fetch
    LOCAL_HEAD=$(git rev-parse HEAD)
    REMOTE_HEAD=$(git rev-parse origin/master)
    
    if [[ "$LOCAL_HEAD" != "$REMOTE_HEAD" ]]; then
        echo "Detected new commits. Pulling changes..."
        git pull
    fi
done
