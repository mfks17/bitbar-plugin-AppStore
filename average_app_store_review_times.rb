#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# <bitbar.title>Reivew Average</bitbar.title>
# <bitbar.version>v0.1.0</bitbar.version>
# <bitbar.author>mfks17</bitbar.author>
# <bitbar.author.github>mfks17</bitbar.author.github>
# <bitbar.desc>Average App Store Review Times</bitbar.desc>
# <bitbar.dependencies>ruby, nokogiri</bitbar.dependencies>

require 'open-uri'
require 'nokogiri'

url = 'http://appreviewtimes.com/'

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

doc.xpath('/html/body/div[2]/div/div[2]/div[1]/p[1]').each do |node|
  puts 'iOS App Store ' + node.text
end
