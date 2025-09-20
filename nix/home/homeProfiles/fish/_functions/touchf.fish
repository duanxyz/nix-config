function touchf
  if test (count $argv) -eq 0
    echo "Usage: touchf <file_path> [--edit]"
    return 1
  end
  set file_path $argv[1]
  set dir (dirname $file_path)
  if not test -d $dir
    mkdir -p $dir
    echo "Created directory: $dir"
  end
  touch $file_path
  echo "Created file: $file_path"
  if contains -- --edit $argv
    $EDITOR $file_path
  end
  if contains -- --content $argv
    set content_index (math (contains -i -- --content $argv) + 1)
    echo $argv[$content_index] > $file_path
  end
  if contains -- --cd $argv
    cd $dir
  end
end
