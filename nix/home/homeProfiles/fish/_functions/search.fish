function search
  if test (count $argv) -eq 0
    echo "Usage: search <pattern> [path]"
    return 1
  end
  set pattern $argv[1]
  set path (test (count $argv) -gt 1; and echo $argv[2]; or echo ".")
  echo "Searching for files matching '$pattern'..."
  fd $pattern $path
  echo "\nSearching for '$pattern' in file contents..."
  rg $pattern $path
end
