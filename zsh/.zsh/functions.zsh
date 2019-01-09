# -------------------------------------------------------------------
# compressed file expander
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
ex() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}

getrepo() {
    if [[ -z "$1" ]]; then
        echo "Please provide the name or URL of a git repository"
	return -1
    fi

    if [[ ! -d $HOME/code ]]; then
	 echo "Creating ~/code directory"
	 mkdir $HOME/code
    fi

    cd $HOME/code
    if [[ $1 =~ "((git|ssh|http(s)?)|(git@[\w\.]+))(:(//)?)([\w\.@\:/\-~]+)(\.git)(/)?" ]]; then
        git clone $repo
	cd -
	return
    fi
	
    {{
        git clone git@bitbucket.org:coursepark/$1.git
    }} || {{
        git clone git@bitbucket.org:$1.git
    }} || {{
        git clone git@github.com:$1.git
    }}

    cd -
}
