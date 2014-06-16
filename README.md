check_dom_on_recur_dns
======================

code almost from [em-udns](https://github.com/ibc/em-udns)

## install (for example on debian) 

    sudo apt-get install ruby ruby-dev ruby-eventmachine

    sudo apt-get install udns-utils libudns-dev libudns0

## usage

    ./check_dom_on_recur_dns.rb [domain] [recur_dns_file]

    ./check_dom_on_recur_dns.rb www.google.com recur.txt > result.txt
    
it's ok when recur.txt line count <= 1000，just dig A record
