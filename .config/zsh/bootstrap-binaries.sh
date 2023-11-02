# bootstrap apps outside of zshrc for portability

# homebrew
eval "$(~/.homebrew/bin/brew shellenv)"

# z cmd
. ~/.homebrew/etc/profile.d/z.sh

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# ocaml opam
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
