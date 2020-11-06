1. Install Homebrew
https://brew.sh/

2. List brew install
brew list | sed s/\s+/\n/g
brew cask list | sed s/\s+/\n/g
brew list --cask | sed s/\s+/\n/g

3. Third Party
brew tap
brew untap ***

4. Reinstall List
brew list | sed s/\s+/\n/g | xargs -L 1 echo 'brew install'
brew list --cask | sed s/\s+/\n/g | xargs -L 1 echo 'brew cask install'
brew tap | xargs -L 1 echo 'brew tap'
