ideaone = "OCU Open Jobs"
ideatwo = "Summer Projects"
ideathree = "Basketball Champs"
ideafour = "Circleville Events"
ideafive = "Bribe Your Friends"
ideasix = "Funny Campus Pictures"

SCHEDULER.every '2s' do
  send_event('ideas', { })
end