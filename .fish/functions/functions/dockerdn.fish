function dockerdn --wraps='systemctl stop docker' --description 'alias dockerdn=systemctl stop docker'
  systemctl stop docker $argv
        
end
