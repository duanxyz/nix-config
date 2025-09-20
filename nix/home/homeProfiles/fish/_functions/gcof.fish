function gcof
  set branch (git branch --all | grep -v HEAD | sk --prompt "Select branch: ")
  if test -n "$branch"
    set branch (string trim $branch | string replace "* " "")
    git checkout $branch
  end
end
