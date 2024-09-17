#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

begin
  postleitzahl = ENV.fetch('PLZ', '55218')

  browser = Ferrum::Browser.new(browser_options: { 'no-sandbox': nil })

  puts 'browser.go_to'
  browser.go_to('https://allergie.hexal.de/pollenflug/vorhersage')
  sleep 2

  puts 'browser.at_css.type.enter'
  puts "grabbing pollen for: #{postleitzahl}"
  browser.at_css('#searchBox').focus.type(postleitzahl, :enter)
  sleep 2

  puts 'browser.mouse.click'
  browser.mouse.click(x: 800, y: 700)
  sleep 1

  6.times do
    puts 'browser.keyboard.type([:down])'
    browser.keyboard.type([:down])
    sleep 0.5
  end
  date_for_image = Time.now.strftime('%Y-%m-%d')
  browser.screenshot(path: "pollen-#{date_for_image}.png")

  # add correct title
  `sed -i 's#.*title.*#  \<title\>Pollen #{postleitzahl}\<\/title\>#' index.html`

  # add correct image
  `sed -i 's#.*img src=.*#  <img src="pollen-#{date_for_image}.png">#' index.html`

  timestamp = Time.now.strftime('%Y-%m-%d %H:%M')
  `sed -i 's#.*span.*#  <span>Update #{timestamp}</span>#' index.html`
ensure
  browser.quit
end
