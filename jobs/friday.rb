current_traffic = 125
past_traffic = 89
traffic_change = 7

SCHEDULER.every '5s' do

  send_event('friday', { current: current_traffic, last: past_traffic })
  send_event('karma', { current: current_traffic, last: past_traffic })
  send_event('synergy',   { value: traffic_change })
end