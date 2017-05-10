class SecretFile
  def initialize(secret_data)
    @logger = SecurityLogger.new
    @data = secret_data
  end

  def data
    @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end
