require_relative '../../app/lib/ucenter/version'
require_relative '../../app/lib/ucenter/configuration'
require_relative '../../app/lib/ucenter/ucenter'

module UCenter

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.connect(agent: nil)
    ::UCenter::UCenter.new agent: agent
  end

end
