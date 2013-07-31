require "scores/version"
require 'mechanize'

module Scores
  # Your code goes here...
  class Scrape
    def get_scores(league)
      # sport = ARGV[0].downcase
      agent = Mechanize.new
      agent.get("http://sports.yahoo.com/#{league}/scoreboard")
      teams = []
      scores = []
      agent.page.parser.css('td.yspscores > b > a').each {|team| teams << team.text}
      agent.page.parser.css('td.ysptblclbg6 > span.yspscores').each {|score| scores << score.text}

      scoreboard = {}
      teams.each do |team|
        if scores[0..2].join.length > 6
          scoreboard[team] = scores.shift(1)
        else  
          scoreboard[team] = scores.shift(3)
        end
      end

      counter = 1
      scoreboard.each do |k,v|
        foo = "                              "
        foo[0] = k
        foo[15] = v.join('   ')
        puts foo
        if counter.even? == true
          puts "-----------------------------"
        end
        counter += 1
      end
    end
  end
end
