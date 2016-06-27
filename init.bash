__cgitc() {
  local arr
  local key
  local value

  while read line; do
    # Strip out comments
    IFS='#' read -ra arr <<< "$line"
    line=${arr[0]}

    # Skip empty lines
    if [[ -z "${line// }" ]]; then
      continue
    fi

    # Split a line into two
    key=${line%% *}
    value=${line#* }
    value="${value#"${value%%[![:space:]]*}"}" # Remove leading whitespaces
    value="${value%"${value##*[![:space:]]}"}" # Remove trailing whitespaces

    alias $key="$value"
  done < "$(dirname "${BASH_SOURCE[0]}")/abbreviations"
}

__cgitc
unset -f __cgitc
