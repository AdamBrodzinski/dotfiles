link_all: link_kitty link_nvim
	echo "Done"

link_kitty:
	ln -s kitty ~/.config/kitty

link_nvim:
	ln -s nvim ~/.config/nvim

link_ack:
	ln -s ackrc ~/.ackrc
