export AWS_CONFIG_FILE='/etc/aws_config.conf'

function agp {
  echo $AWS_DEFAULT_PROFILE

}
function asp {
  export AWS_DEFAULT_PROFILE=$1
  export RPROMPT="<aws:$AWS_DEFAULT_PROFILE>"
}

function aws_profiles {
  reply=($(grep profile $AWS_CONFIG_FILE | sed -e 's/.*profile \([a-zA-Z0-9_-]*\).*/\1/' ))
}

if which aws > /dev/null 2>&1; then
  compctl -K aws_profiles asp
  source $(which aws_zsh_completer.sh)
fi
