Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

# Always allow requests from localhost
# (blocklist & throttles are skipped)
Rack::Attack.safelist('allow from localhost') do |req|
  # Requests are allowed if the return value is truthy
  req.ip == '127.0.0.1' || req.ip == '::1'
end

# Throttle requests to 5 requests per second per ip
Rack::Attack.throttle('req/ip', limit: 1, period: 1.second) do |req|
  # If the return value is truthy, the cache key for the return value
  # is incremented and compared with the limit. In this case:
  #   "rack::attack:#{Time.now.to_i/1.second}:req/ip:#{req.ip}"
  #
  # If falsy, the cache key is neither incremented nor checked.

  req.ip
end

Rack::Attack.blocklisted_response = lambda do |_env|
  # Using 503 because it may make attacker think that they have successfully
  # DOSed the site. Rack::Attack returns 403 for blocklists by default
  [503, {}, ['Blocked']]
end

Rack::Attack.throttled_response = lambda do |_env|
  # NB: you have access to the name and other data about the matched throttle
  #  env['rack.attack.matched'],
  #  env['rack.attack.match_type'],
  #  env['rack.attack.match_data']

  # Using 503 because it may make attacker think that they have successfully
  # DOSed the site. Rack::Attack returns 429 for throttling by default
  [503, {}, ['Limite Request']]
end
