server_name=
# example server_name=test
dir_path=
# example dir_path= /mnt/a

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

cd $dir_path
dir=($(ls -d */))

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
    "description": ":desktop::'"$server_name"' \n :clock3::'"$now_time"' \n :red_circle: Start update docker :warning: "
  }]
}' \
"$discord_webhook"
fi

if [ "$gotify" = "true" ]; then
    curl "$gotify_url/message?token=$gotify_token" -F "title=Docker_update_bot" -F "message= Server:$server_name Start update docker. time: $now_time" -F "priority=5"
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
        "description": ":desktop::'"$server_name"' \n :clock3::'"$now_time"' \n :brown_circle: Now Updating: '"$x"'"
    }]
    }' \
    "$discord_webhook"
    fi

    if [ "$gotify" = "true" ]; then
        curl "$gotify_url/message?token=$gotify_token" -F "title=Docker_update_bot" -F "message= Server:$server_name Now Updating: $x. time: $now_time " -F "priority=5"
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
    "description": ":desktop::'"$server_name"' \n :clock3::'"$now_time"' \n :green_circle: All Docker update done. :white_check_mark: "
  }]
}' \
"$discord_webhook"
fi

if [ "$gotify" = "true" ]; then
    curl "$gotify_url/message?token=$gotify_token" -F "title=Docker_update_bot" -F "message= Server:$server_name All Docker update done. time: $now_time" -F "priority=5"
fi
