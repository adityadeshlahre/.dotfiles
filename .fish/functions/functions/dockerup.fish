function dockerup --wraps='systemctl start docker' --description 'alias dockerup=systemctl start docker'
  systemctl start docker $argv
        
end
