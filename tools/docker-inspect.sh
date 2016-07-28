#/bin/bash
docker inspect  -f "{{.Name}} {{.Config.Cmd}}" $(docker ps -a -q)
