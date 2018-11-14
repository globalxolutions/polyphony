# frozen_string_literal: true

require 'modulation'

Rubato = import('../../lib/rubato')

async def my_sleep(t)
  await sleep(t)
  raise "blah"
end

spawn do
  puts "#{Time.now} going to sleep..."
  result = await supervise do |s|
    s.spawn my_sleep(1)
    s.spawn my_sleep(2)
    s.spawn my_sleep(3)
  end
rescue => e
  puts "exception from supervisor: #{e}"
ensure
  puts "#{Time.now} woke up"
end
