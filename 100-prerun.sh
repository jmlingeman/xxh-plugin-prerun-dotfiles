if [[ $XDG_CACHE_HOME ]]; then
  done_file=$XDG_CACHE_HOME/xxh-plugin-prerun-dotfiles-done
else
  done_file=$XXH_HOME/.xxh-plugin-prerun-dotfiles-done
fi

if [[ ! -f $done_file ]]; then
  CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  if [[ ! -d $CURR_DIR/home ]]; then
    `mkdir $CURR_DIR/home`
  fi
  cd $CURR_DIR/home

  `curl -fLo yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x yadm`
  `./yadm clone https://github.com/jmlingeman/dotfiles.git`
fi
cd $XXH_HOME
