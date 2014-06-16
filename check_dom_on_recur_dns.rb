#!/usr/bin/ruby

require "rubygems"
require "em-udns"

name = ARGV[0]
ns_list = File.readlines(ARGV[1])
times =ns_list.length

EM.set_max_timers 100000
EM.run do

  second = 0
  EM.add_periodic_timer(1) {
    #      puts "[#{second += 1}] - active queries: #{resolver.active}"
  }

  sent = 0
  recv = 0

  timer = EM::PeriodicTimer.new(0) do
    if sent == times
      timer.cancel

    else
      ns = ns_list[sent].chomp
      EM::Udns.nameservers =ns
      resolver = EM::Udns::Resolver.new
      EM::Udns.run resolver
      sent += 1

      query = resolver.submit_A name

      query.callback do |result|
        recv += 1
        puts "#{ns} : #{result.inspect}"
        if recv == times
          exit
        end
      end

      query.errback do |error|
        recv += 1
        puts "#{ns} #{error.inspect}"
        if recv == times
          exit
        end
      end

    end

  end

end
