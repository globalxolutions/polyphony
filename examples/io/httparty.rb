# frozen_string_literal: true

require 'bundler/setup'
require 'polyphony'
require 'httparty'

timer = coproc { throttled_loop(10) { STDOUT << '.' } }

puts HTTParty.get('http://realiteq.net/?q=time')
timer.stop