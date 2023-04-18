server_name=
# example server_name=test
dir_path=
# example dir_path= /mnt/a
cd $dir_path
dir=($(ls -d */))
# example dir=(a b c d) default:($(ls -d */)) it scan all dir

gotify=false
gotify_url=
# example gotify_url=https://example.com
gotify_token=
# example gotify_token=aabbccddeeff

discord=false
discord_webhook=
# example discord_webhook=https://discord.com/api/webhooks/#/#
discord_server_icon=
# example discord_server_icon=https://www.testedtechnology.co.uk/wp-content/uploads/2020/12/UnRAID-Icon-201x201.png

telegram=false
telegram_bot_token=
# example telegram_bot_token=xxxx:xxxxxxxxxxxxxxxxxxxx
telegram_user_id=
# example telegram_user_id=telegram_user_id

# start
now_time=$(date +"%F %T")

if [ "$discord" = "true" ]; then
curl -H "Content-Type: application/json" \
-d \
'{
  "username": "Docker_update_bot",
  "avatar_url": "https://w7.pngwing.com/pngs/256/416/png-transparent-docker-github-node-js-mongodb-computer-software-github-blue-marine-mammal-logo.png",
  "embeds": [{
    "author":
    {
    "name": "'"$server_name"'",
    "icon_url": "'"$discord_server_icon"'"
    },
    "color": 13043755,
    "description": "💻:'"$server_name"' \n 🕒:'"$now_time"' \n 🔴 Start update docker ⚠ "
  }]
}' \
"$discord_webhook"
fi

if [ "$gotify" = "true" ]; then
    curl "$gotify_url/message?token=$gotify_token" \
        -F "title=Docker_update_bot" \
        -F "message= 💻:$server_name 🔴 Start update docker. ⚠ 🕒: $now_time" \
        -F "priority=5"
fi

if [ "$telegram" = "true" ]; then
    curl -X POST \
        -H 'Content-Type: application/json' \
        -d '{"chat_id": "'"$telegram_user_id"'", "text": "💻:'"$server_name"' \n 🕒:'"$now_time"' \n 🔴 Start update docker ⚠ ", "disable_notification": true}' \
        "https://api.telegram.org/bot$telegram_bot_token/sendMessage"
fi
# body

for x in ${dir[@]}; do
    now_time=$(date +"%F %T")

    if [ "$discord" = "true" ]; then
    curl -H "Content-Type: application/json" \
    -d \
    '{
    "username": "Docker_update_bot",
    "avatar_url": "https://w7.pngwing.com/pngs/256/416/png-transparent-docker-github-node-js-mongodb-computer-software-github-blue-marine-mammal-logo.png",
    "embeds": [{
        "author":
            {
            "name": "'"$server_name"'",
            "icon_url": "'"$discord_server_icon"'"
            },
        "color": 15564090,
        "description": "💻:'"$server_name"' \n 🕒:'"$now_time"' \n 🟠 Now Updating: '"$x"'"
    }]
    }' \
    "$discord_webhook"
    fi

    if [ "$gotify" = "true" ]; then
        curl "$gotify_url/message?token=$gotify_token" \
            -F "title=Docker_update_bot" \
            -F "message= 💻:$server_name 🟠 Now Updating: $x. 🕒: $now_time " \
            -F "priority=5"
    fi
    if [ "$telegram" = "true" ]; then
        curl -X POST \
            -H 'Content-Type: application/json' \
            -d '{"chat_id": "'"$telegram_user_id"'", "text": "💻:'"$server_name"' \n 🕒:'"$now_time"' \n 🟠 Now Updating: '"$x"'", "disable_notification": true}' \
            "https://api.telegram.org/bot$telegram_bot_token/sendMessage"
    fi
    up_docker_dir=$dir_path/${x}
    cd "$up_docker_dir"
    docker compose pull
    docker compose up -d
done

# end

now_time=$(date +"%F %T")
if [ "$discord" = "true" ]; then
curl -H "Content-Type: application/json" \
-d \
'{
  "username": "Docker_update_bot",
  "avatar_url": "https://w7.pngwing.com/pngs/256/416/png-transparent-docker-github-node-js-mongodb-computer-software-github-blue-marine-mammal-logo.png",
  "embeds": [{
    "author":
        {
        "name": "'"$server_name"'",
        "icon_url": "'"$discord_server_icon"'"
        },
    "color": 3129201, 
    "description": "💻:'"$server_name"' \n 🕒:'"$now_time"' \n 🟢 All Docker update done. ☑"
  }]
}' \
"$discord_webhook"
fi

if [ "$gotify" = "true" ]; then
    curl "$gotify_url/message?token=$gotify_token" \
        -F "title=Docker_update_bot" \
        -F "message= 💻:$server_name 🟢All Docker update done☑. 🕒: $now_time" \
        -F "priority=5"
fi

if [ "$telegram" = "true" ]; then
    curl -X POST \
        -H 'Content-Type: application/json' \
        -d '{"chat_id": "'"$telegram_user_id"'", "text": "💻:'"$server_name"' \n 🕒:'"$now_time"' \n 🟢 All Docker update done. ☑", "disable_notification": true}' \
        "https://api.telegram.org/bot$telegram_bot_token/sendMessage"
fi

# 🔴
# 🟠
# 🟢
# 💻
# ☑
# 🕒
# ⚠
