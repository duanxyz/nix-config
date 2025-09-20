function up
  set levels (math $argv[1] + 0)
  if test $levels -le 0
    echo "Please provide a positive number of levels to go up"
    return 1
  end
  set path (string repeat -n $levels "../")
  cd $path
end
