# if not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# tell the terminal config dir
export CONFIG_DIR="$HOME/.config"


# source all bashrc files
if [ -d "$CONFIG_DIR/bash" ]; then
    for file in "$CONFIG_DIR/bash"/*.sh; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
    done
    unset file
fi
