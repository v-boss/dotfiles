# update on one command 
alias update='sudo apt-get update && sudo apt-get upgrade'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i' 
alias cp='cp -i' 
alias ln='ln -i'

# Opens Custom Music Script (Mopidy & ncmpcpp)
alias music='~/.scripts/music'
