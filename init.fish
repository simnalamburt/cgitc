function init -a path --on-event init_cgitc
  # Skip if $cgitc_initialized is set
  if set -q cgitc_initialized; return; end

  printf 'Initializing \e[33mcgitc\e[0m ... '
  for line in (cat (dirname (status -f))/abbreviations)
    # 1.  Strip out comments
    # 2.  Squeeze repeating spaces
    # 3.  Strip trailing whitespaces
    set line (echo "$line" | cut -d '#' -f 1 | tr -s ' ' | sed 's/[[:space:]]*$//')

    # Skip empty lines
    if not [ "$line" ]; continue; end

    # Parse lines
    set key   (echo "$line" | cut -d ' ' -f 1)
    set value (echo "$line" | cut -d ' ' -f 2-)

    abbr $key $value
  end

  set -U cgitc_initialized
  echo 'Done'
end
