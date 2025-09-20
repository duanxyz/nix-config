function extract
  if test (count $argv) -eq 0
    echo "Usage: extract <archive>"
    return 1
  end
  set file $argv[1]
  if not test -f $file
    echo "$file does not exist"
    return 1
  end
  switch $file
    case '*.tar.gz' '*.tgz'
      tar -xvzf $file
    case '*.tar.xz'
      tar -xvJf $file
    case '*.tar.bz2' '*.tbz2'
      tar -xvjf $file
    case '*.tar'
      tar -xvf $file
    case '*.gz'
      gunzip $file
    case '*.bz2'
      bunzip2 $file
    case '*.zip'
      unzip $file
    case '*.rar'
      unrar x $file
    case '*'
      echo "Unsupported archive format: $file"
      return 1
  end
end
