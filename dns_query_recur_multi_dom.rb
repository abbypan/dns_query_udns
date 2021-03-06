#!/usr/bin/ruby

require "rubygems"
require "em-udns"

recur = ARGV[0]
dom_list = File.readlines(ARGV[1])
times =dom_list.length

max_sec =  20*60;
now_sec = 0;


EM.set_max_timers 100000
EM.run do

  EM.add_periodic_timer(10) {
        now_sec += 10;
        if now_sec > max_sec
            exit
        end
  }

  sent = 0
  recv = 0

  timer = EM::PeriodicTimer.new(0) do
    if sent == times
      timer.cancel

    else
      dom = dom_list[sent].chomp
      EM::Udns.nameservers = recur
      resolver = EM::Udns::Resolver.new
      EM::Udns.run resolver
      sent += 1

      query = resolver.submit_A dom

      query.callback do |result|
        recv += 1
        puts "#{dom} : #{result.inspect}"
        if recv == times
          exit
        end
      end

      query.errback do |error|
        recv += 1
        puts "#{dom} #{error.inspect}"
        if recv == times
          exit
        end
      end

    end

  end

end
