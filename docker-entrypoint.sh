gh auth login
mkdir ./.config/nvim

while read line
do
  match=$(node -e "console.log('${line}'.match(/user: ([a-z]+)/)?.[1])")
  if [ $match != "undefined" ]
  then
    git clone "https://github.com/${match}/nvim.git" ./.config/nvim
    break
  fi
done < .config/gh/hosts.yml

tmux -2
