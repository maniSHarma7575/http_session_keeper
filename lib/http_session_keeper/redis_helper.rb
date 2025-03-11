require 'redis'
require 'json'

class RedisHelper
  def initialize(redis_url)
    @redis = Redis.new(url: redis_url)
  end

  def get(key)
    return unless @redis.get(key)

    JSON.parse(@redis.get(key))
  end

  def set(key, value, expire: nil)
    @redis.set(key, value.to_json)
    @redis.expire(key, expire) if expire
  end

  def delete(key)
    @redis.del(key)
  end
end

