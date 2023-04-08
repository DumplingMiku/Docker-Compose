server_name=
discord_webhook=
dir_path=
dir=()
# only edit up info
now_time=$(date +"%F %T")
curl -H "Content-Type: application/json" -d '{"username": "docker_update_bot", "content": "'"$server_name"' server update docker compose start. time: '"$now_time"' "}' "$discord_webhook"
for x in ${dir[@]}; do
    curl -H "Content-Type: application/json" -d '{"username": "docker_update_bot", "content": "update '"$x"'"}' "$discord_webhook"
    up_docker_dir=$dir_path/${x}
    cd "$up_docker_dir"
    docker compose pull
    docker compose up -d
done
echo "y" | docker image prune 
curl -H "Content-Type: application/json" -d '{"username": "docker_update_bot", "content": "update docker compose over."}' "$discord_webhook"
