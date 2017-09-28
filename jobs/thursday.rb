current_traffic = 249
past_traffic = 62
traffic_change = 7

SCHEDULER.every '5s' do

  send_event('thursday', { current: current_traffic, last: past_traffic })
  send_event('karma', { current: current_traffic, last: past_traffic })
  send_event('synergy',   { value: traffic_change })
end