while read line; do
  # 1.  Strip out comments
  # 2.  Squeeze repeating spaces
  # 3.  Strip trailing whitespaces
  local line=$(echo "$line" | cut -d '#' -f 1 | tr -s ' ' | sed 's/[[:space:]]*$//')

  # Skip empty lines
  if [ -z "$line" ]; then; continue; fi

  # Parse lines
  local key=$(echo "$line" | cut -d ' ' -f 1)
  local value=$(echo "$line" | cut -d ' ' -f 2-)

  alias $key=$value
done < ${0:a:h}/abbreviations
