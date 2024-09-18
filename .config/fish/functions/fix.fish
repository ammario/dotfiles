function fix --wraps='stty sane' --description 'alias fix=stty sane'
  stty sane $argv; 
end
