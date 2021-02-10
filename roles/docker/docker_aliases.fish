abbr -a -g d docker 
abbr -a -g dlog docker logs -f --tail 100 
abbr -a -g dl docker logs -f --tail 100 
abbr -a -g ddf docker system df
# Stop and remove a single container
abbr -a -g drm docker rm -f 
# Stop and remove all running containers
function drm!
  docker rm -f (docker ps -a -q)
end

abbr -a -g dc docker-compose
abbr -a -g dcup docker-compose up -d 
abbr -a -g dcrun docker-compose run --rm 
function dcdebug
  docker-compose kill $argv
  docker-compose run --service-ports $argv
end
# Stop and recreate a container
abbr -a -g dcre docker-compose up -d --force-recreate --no-deps 
abbr -a -g dcl docker-compose logs -f --tail 100 

abbr -a -g ds docker-sync
abbr -a -g dss docker-sync start
abbr -a -g dsx docker-sync stop

abbr -a -g dsb docker-sync-stack
abbr -a -g dsbs docker-sync-stack start
abbr -a -g dsbx docker-sync-stack stop

abbr -a -g dcbomb! docker-compose down -v

# Open bash in a container. Pass docker-compose name
function dcbash
  docker-compose exec $argv /bin/bash
end

# Open bash in a container. Pass container name
function dbash
  docker exec -it $argv /bin/bash
end

function dir!
  docker image rm (docker image ls -q)
end