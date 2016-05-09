module RubyCast
  class Chromecast
    extend Forwardable
    def_delegator :@mdns_response, :name

    attr_reader :socket, :mdns_response

    def initialize(mdns_response, logger=nil)
      @logger = logger.nil? ? Logger.new(STDOUT) : logger
      @mdns_response = mdns_response
      @socket = nil
    end

    def connect
      @socket = @mdns_response.connect
    end

    def close
      @socket.close unless @socket.nil?
    end

    def connected?
      @socket != nil
    end
  end
end
