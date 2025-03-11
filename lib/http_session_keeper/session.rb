require 'securerandom'

class Session
  def initialize(cookie, session_store)
    @cookie = cookie
    @session_store = session_store
    @session_id = cookie["session_id"] || SecureRandom.hex(16)

    @data = @session_store.get(@session_id) || {}
  end

  def [](key)
    @data[key]
  end

  def []=(key, value)
    @data[key] = value
  end

  def save
    @session_store.set(@session_id, @data, expire: 3600)
    @cookie["session_id"] = @session_id
    @cookie
  end

  def destroy
    @session_store.delete(@session_id)
    @data = {}
  end
end

