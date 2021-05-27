# share the current directory (public is readable by all connected users)
# user:pass is watosamba:watosamba (read-write) or use guest access (readonly)

# more documentation here: https://github.com/dperson/samba

docker stop samba
docker rm samba

docker run -it --name samba -p 139:139 -p 445:445 -e USERID=$(id -u) -e GROUPID=$(id -g) -v $(pwd):/share -d dperson/samba -p -u "watosamba;watosamba" -s "public;/share/public;;;;;;watosamba;" -g "log level = 3" -S
