for line in (cat (dirname (status -f))/abbreviations)
  # 1.  Strip out comments
  # 2.  Squeeze repeating spaces
  # 3.  Strip trailing whitespaces
  set line (echo "$line" | cut -d '#' -f 1 | tr -s ' ' | sed 's/\s*$//')

  # Skip empty lines
  if not [ "$line" ]; continue; end

  # Parse lines
  set key (echo "$line" | cut -d ' ' -f 1)

  abbr --erase "$key"
end
set --erase -U cgitc_revision
