dns_query_udns
==============

code almost from [em-udns](https://github.com/ibc/em-udns)

## install (for example on debian) 

    sudo apt-get update

    sudo apt-get install build-essential

    sudo apt-get install ruby ruby-dev ruby-eventmachine

    sudo apt-get install udns-utils libudns-dev libudns0

    sudo gem sources --remove https://rubygems.org/

    sudo gem sources -a https://ruby.taobao.org/

    sudo gem install em-udns

## usage

    ./dns_query_dom_multi_recur.rb [domain] [recur_dns_file]

    ./dns_query_dom_multi_recur.rb www.google.com recur.txt > recur-google.com.txt

    ./dns_query_recur_multi_dom.rb [recur] [domain_file]

    ./dns_query_recur_multi_dom.rb 8.8.8.8 dom.txt > dom-8.8.8.8.txt
    
    
it's ok when recur.txt/dom.txt line count <= 1000，just dig A record
