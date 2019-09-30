
run/test:
	docker build -t myself:dotester ./docker && docker run --rm --privileged -it \\
		-u user \\
		-v $(pwd):/home/user/dotfiles \\
		-w /home/user/dotfiles \\
		-e LOCAL_UID=$(id -u $USER) \\
		-e LOCAL_GID=$(id -g $USER) \\
		myself:dotester install.sh
