current_traffic = 190
past_traffic = 35
traffic_change = 7

SCHEDULER.every '5s' do

  send_event('wednesday', { current: current_traffic, last: past_traffic })
  send_event('karma', { current: current_traffic, last: past_traffic })
  send_event('synergy',   { value: traffic_change })
end