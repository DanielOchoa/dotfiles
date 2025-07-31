echo "Installing dotfiles..."

# List dotfiles here
dotfiles=(".tmux.conf")

# List config directories (for .config/ directory)
configdirs=("nvim")
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

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Symlink config directories
for configdir in ${configdirs[@]}; do
  echo "Creating symlink for config/${configdir}..."
  if [ -L ~/.config/${configdir} ] || [ -d ~/.config/${configdir} ]
  then
    echo "~/.config/${configdir} already exists! skipping ..."
  else
    ln -sf ${DIR}/${configdir} ~/.config/${configdir}
  fi
done

echo ""
echo "Done!"
