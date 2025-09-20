function zd
  set dir (zoxide query -l | sk --prompt "Select directory: ")
  if test -n "$dir"
    z $dir
  end
end
