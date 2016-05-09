require 'dnssd'
require 'logger'
require 'ruby_cast/chromecast'

module RubyCast
  class ChromecastFinder
    extend Forwardable
    def_delegators :@chromecasts, :[], :size, :all?, :any?, :find, :each, :select, :first

    CHROMECAST_TYPE = '_googlecast._tcp.'.freeze
    def initialize(logger = nil)
      @logger = logger.nil? ? Logger.new(STDOUT) : logger
      @chromecasts = []
    end

    def find_chromecasts
      DNSSD.browse '_googlecast._tcp.' do |reply|
        mdns_replied(reply)
      end
    end

    def find_chromecasts!
      DNSSD.browse! '_googlecast._tcp.' do |reply|
        mdns_replied(reply)
      end
    end

    private

    def mdns_replied(reply)
      @logger.debug "Found new Chromecast #{reply.name}"
      @chromecasts << Chromecast.new(reply, @logger)
    end

  end
end