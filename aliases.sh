#! /bin/bash

# To use these aliases and functions, remember the following acronyms:
# rm = remove
# ls = list
# img = image(s)
# cont = container(s)
# idle = stopped (not paused or doing nothing)
# all means ALL. !all = "only running cont/used img"


# * IMAGES

# count images
alias dkr-cnt-img="docker images -q | wc --lines"
# remove ALL images!
alias dkr-rm-all-img="docker rmi -f &(docker images -q}')"
# count images not used by any container
alias dkr-cnt-unused-img="docker images | grep "^<none>" | wc --lines"
# remove images not used by any container
alias dkr-rm-unused-img="docker rmi $(docker images | grep "^<none>" | awk '{print $3}')"


# * TAGS

# show tags for specified image
function dkr-ls-tag-by-img {
	docker images | grep -i "$1" | awk '{print $2}'
}


# * CONTAINERS

# show all containers based on specified image
function dkr-ls-cont-by-img {
	docker ps -a | grep -i "$1" | awk '{print $1}'
}
# remove ALL containers!
alias dkr-rm-all-cont="docker rm -f $(docker ps -a -q)"
# stop all containers
alias dkr-stop="docker stop $(docker ps -q)"
# pause all containers
alias dkr-pause="docker pause $(docker ps -q)"
# unpause all containers
alias dkr-unpause="docker unpause $(docker ps -q)"
# remove stopped containers:
# check that all important containers are running before calling this!
alias dkr-rm-idle-cont="docker rm $(docker ps -a -q)"
# remove stopped containers based on specified image
function dkr-rm-cont-by-img {
	docker rm $(docker ps -a | grep -i "$1" | awk '{print $1}')
}


