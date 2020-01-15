PROXY_CONFIG=$HOME/.proxy_config
[[ -f $PROXY_CONFIG ]] && . $PROXY_CONFIG

function set_proxy() {
  [[ -f $PROXY_CONFIG ]] && . $PROXY_CONFIG
  export http_proxy=$http_proxy_value
  export https_proxy=$http_proxy_value
  export CURL_PROXY_OPTION="-x $http_proxy_value"
}

function unset_proxy() {
  export http_proxy=
  export https_proxy=
  export CURL_PROXY_OPTION=
}

# set/unset proxy environment variables according to ~/.proxy_config
alias pset=set_proxy
alias punset=unset_proxy
