require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class Worker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when 'super_hard'
      sleep 20
      puts 'sleeping'
    when 'easier'
      sleep 1
      puts 'easier'
    end
  end
end