current_traffic = 132
past_traffic = 42
traffic_change = 7

SCHEDULER.every '5s' do

  send_event('monday', { current: current_traffic, last: past_traffic })

end