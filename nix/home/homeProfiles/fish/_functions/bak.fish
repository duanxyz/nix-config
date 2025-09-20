function bak
  if test (count $argv) -eq 0
    echo "Usage: bak <file>"
    return 1
  end
  set file $argv[1]
  if not test -f $file
    echo "$file does not exist"
    return 1
  end
  cp $file $file.bak
  echo "Created backup: $file.bak"
end
