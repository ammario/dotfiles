function we --wraps='watchexec -r -c --' --description 'alias we=watchexec -r -c --'
  watchexec -i '.sl' -r -c -- $argv; 
end
