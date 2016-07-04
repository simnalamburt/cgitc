autoload -U is-at-least
if is-at-least 5.1.0; then
  __CGITC_CMD="local arr=(\"\${(@s/#/)line}\")
line=\$arr[1]"
else
  __CGITC_CMD="line=\$(echo \"\$line\" | cut -d '#' -f 1)"
fi

while read line; do
  # Strip out comments
  eval $__CGITC_CMD

  # Skip empty lines
  if [ -z "$line" ]; then; continue; fi

  # Split a line into two
  local key=$line[(w)1]
  local value=${line#* }
  value="${value#"${value%%[![:space:]]*}"}" # Remove leading whitespaces
  value="${value%"${value##*[![:space:]]}"}" # Remove trailing whitespaces

  alias $key=$value
done < ${0:a:h}/abbreviations

unset __CGITC_CMD
