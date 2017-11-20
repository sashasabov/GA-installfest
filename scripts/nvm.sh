#!/usr/bin/env bash
# if the script is run with 0 arguments
if [[ $# -eq 0 ]] ; then
  # install nvm with brew
  brew install nvm
  # create .nvm directory inside home directory
  mkdir -p ~/.nvm
  # search for the followign string in .bashrc
  if grep -Fq "export NVM_DIR=~/.nvm" ~/.bashrc
  then
    # if found, output success message to the terminal
    echo -e '\nAll set! ENV var for NVM_DIR already set in ~/.bashrc'
  else
    # if string is not in .bashrc, add the following lines to .bashrc
cat <<'EOF' >> ~/.bashrc

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

EOF
  fi
fi

# if script is run with argument 'node'
if [[ $1 = "node" ]]; then
  # source nvm for the environment of this script execution
  . $(brew --prefix nvm)/nvm.sh
  # install node version boron
  # if that fails, install node based on version number
  nvm install --lts=carbon || nvm install 8.9.1
  # set version 6.x as default node version
  nvm alias default v6
fi

echo -e "\nRestart your terminal\n"
