# Support fish < 2.2
switch "$FISH_VERSION"; case 2.1.2 2.1.1 2.1.0 2.0.0
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

    alias $key $value
  end
  exit
end

# Skip if cgitc_revision is up to date
set -l current_revision (git -C (dirname (status -f)) rev-parse HEAD)
if [ "$cgitc_revision" != "$current_revision" ]
  printf 'Initializing \x1b[33mcgitc\x1b[0m ... '
  set -l cgitc_text (
    for line in (cat (dirname (status -f))/abbreviations)
      # 1.  Strip out comments
      # 2.  Squeeze repeating spaces
      # 3.  Strip trailing whitespaces
      set line (echo "$line" | cut -d '#' -f 1 | tr -s ' ' | sed 's/[[:space:]]*$//')

      # Skip empty lines
      if not [ "$line" ]; continue; end

      # Wrap with double quote
      echo "\"$line\""
    end | tr '\n' ' '
  )

  echo "set -gx fish_user_abbreviations \$fish_user_abbreviations $cgitc_text" > (dirname (status -f))/run.fish

  set -U cgitc_revision "$current_revision"
  echo 'Done'
end
. (dirname (status -f))/run.fish
