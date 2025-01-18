_pkgx_chpwd_hook() {
  if ! type _pkgx_dev_try_bye >/dev/null 2>&1 || _pkgx_dev_try_bye; then
    dir="$PWD"
    while [ "$dir" != "/" ]; do
      if [ -f "/Users/joe/Library/Application Support/pkgx/dev/$dir/dev.pkgx.activated" ]; then
        eval "$(/Users/joe/.pkgx/pkgx.sh/dev/v1.4.0/bin/dev)"
        break
      fi
      dir="$(dirname "$dir")"
    done
  fi
}

dev() {
  case "$1" in
  off)
    if type -f _pkgx_dev_try_bye >/dev/null 2>&1; then
      rm "/Users/joe/Library/Application Support/pkgx/dev$PWD/dev.pkgx.activated"
      PWD=/ _pkgx_dev_try_bye
    else
      echo "no devenv" >&2
    fi;;
  ''|on)
    if [ "$2" ]; then
      "/Users/joe/.pkgx/pkgx.sh/dev/v1.4.0/bin/dev" "$@"
    elif ! type -f _pkgx_dev_try_bye >/dev/null 2>&1; then
      mkdir -p "/Users/joe/Library/Application Support/pkgx/dev$PWD"
      touch "/Users/joe/Library/Application Support/pkgx/dev$PWD/dev.pkgx.activated"
      eval "$(/Users/joe/.pkgx/pkgx.sh/dev/v1.4.0/bin/dev)"
    else
      echo "devenv already active" >&2
    fi;;
  *)
    "/Users/joe/.pkgx/pkgx.sh/dev/v1.4.0/bin/dev" "$@";;
  esac
}

if [ -n "$ZSH_VERSION" ] && [ $(emulate) = zsh ]; then
  eval 'typeset -ag chpwd_functions

        if [[ -z "${chpwd_functions[(r)_pkgx_chpwd_hook]+1}" ]]; then
          chpwd_functions=( _pkgx_chpwd_hook ${chpwd_functions[@]} )
        fi

        if [ "$TERM_PROGRAM" != Apple_Terminal ]; then
          _pkgx_chpwd_hook
        fi'
elif [ -n "$BASH_VERSION" ] && [ "$POSIXLY_CORRECT" != y ] ; then
  eval 'cd() {
          builtin cd "$@" || return
          _pkgx_chpwd_hook
        }
        _pkgx_chpwd_hook'
else
  POSIXLY_CORRECT=y
  echo "pkgx: dev: warning: unsupported shell" >&2
fi
