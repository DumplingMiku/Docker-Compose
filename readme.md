# Install Docker
`curl -fsSL https://get.docker.com/ | sudo sh`
# Create/Update Docker Compose
`docker compose up -d`
# Create Docker Compose with yml
`docker compose -f xxx.yml up -d`

example `a.yml` in /docker/a

input `docker compose -f /docker/a/a.yml up -d`
# Remove Docker Compose
`docker compose down`
# Start Docker Compose
`docker compose start`
# Stop Docker Compose
`docker compose stop`
# Docker Tutorial Chinese
[Tutorial](https://github.com/twtrubiks/docker-tutorial) https://github.com/twtrubiks/docker-tutorial
# Docker compose update shell
`curl -O https://raw.githubusercontent.com/DumplingMiku/docker-compose/master/auto_update_docker.sh`
