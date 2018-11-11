echo "Installing dotfiles..."

# List dotfiles here
dotfiles=(".tmux.conf" ".vimrc")
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for dotfile in ${dotfiles[@]}; do
  echo "Creating symlink for ${dotfile}..."
  if [ -L ~/${dotfile} ] || [ -f ~/${dotfile} ]
  then
    echo "${dotfile} already exists! skipping ..."
  else
    ln -sf ${DIR}/${dotfile} ~/${dotfile}
  fi
done
echo ""
echo "Done!"
