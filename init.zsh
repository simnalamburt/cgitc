while read line; do
  # Strip out comments
  local arr=("${(@s/#/)line}")
  line=$arr[1]

  # Skip empty lines
  if [ -z "$line" ]; then; continue; fi

  # Split a line into two
  local key=$line[(w)1]
  local value=${line#* }
  value="${value#"${value%%[![:space:]]*}"}" # Remove leading whitespaces
  value="${value%"${value##*[![:space:]]}"}" # Remove trailing whitespaces

  alias $key=$value
done < ${0:a:h}/abbreviations
