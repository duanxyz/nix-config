function gcl
  git clone $argv[1]
  set repo_name (basename $argv[1] .git)
  cd $repo_name
end
