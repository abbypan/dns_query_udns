check_dom_on_recur_dns
======================

code almost from [em-udns](https://github.com/ibc/em-udns)

## install (for example on debian) 

{% highlight bash %}    
sudo apt-get install build-essential
sudo apt-get install ruby ruby-dev ruby-eventmachine
sudo apt-get install udns-utils libudns-dev libudns0
sudo gem sources --remove http://rubygems.org/
sudo gem sources -a http://ruby.taobao.org/
sudo gem install em-udns
{% endhighlight %}

## usage

    ./check_dom_on_recur_dns.rb [domain] [recur_dns_file]

    ./check_dom_on_recur_dns.rb www.google.com recur.txt > result.txt
    
    
it's ok when recur.txt line count <= 1000，just dig A record
