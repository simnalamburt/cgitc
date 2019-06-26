# Support fish < 2.2
if printf '2.2.0\n%s' "$FISH_VERSION" | sort --check=silent --version-sort
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
set -l current_revision (git -C (dirname (realpath (status -f))) rev-parse HEAD)
if [ "$cgitc_revision" != "$current_revision" ]
  printf 'Initializing \x1b[33mcgitc\x1b[0m ... '

  set -l cgitc_text

  if printf '3.0.0\n%s' "$FISH_VERSION" | sort --check=silent --version-sort
    # For 2.2.0 < fish < 3.0.0 use fish_user_abbreviations env. var
    set -l cgitc_text (
      for line in (cat (dirname (realpath (status -f)))/abbreviations)
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
    echo "set -gx fish_user_abbreviations \$fish_user_abbreviations $cgitc_text" > (realpath (dirname (status -f)))/run.fish
  else
    # For fish > 3.0.0 use abbr command
    set cgitc_text (
      for line in (cat (dirname (realpath (status -f)))/abbreviations)
        # 1.  Strip out comments
        # 2.  Squeeze repeating spaces
        # 3.  Strip trailing whitespaces
        set line (echo "$line" | cut -d '#' -f 1 | tr -s ' ' | sed 's/[[:space:]]*$//')

        # Skip empty lines
        if not [ "$line" ]; continue; end

        # Tokenize
        set line (string split ' ' $line)

        # Wrap with calling 'abbr'
        echo "abbr --add --global -- $line[1] \"$line[2..-1]\""
      end
    )
    echo -s \n$cgitc_text > (realpath (dirname (status -f)))/run.fish
  end
  set -U cgitc_revision "$current_revision"
  echo 'Done'
end
source (realpath (dirname (status -f)))/run.fish
