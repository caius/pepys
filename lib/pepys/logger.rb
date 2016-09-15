require "socket"
require "logger"
require "json"
require "pepys/formatter"

module Pepys
  class Logger
    REFUSE_TO_FORWARD = %i(formatter=)

    attr_reader :hostname, :program_name

    def initialize(program_name, io, hostname: Socket.gethostname)
      self.program_name = program_name
      self.hostname = hostname
      self.logger = ::Logger.new(io)
      logger.formatter = Formatter.new(self)
    end

    def base_fields
      {
        name: program_name,
        pid: Process.pid,
        hostname: hostname,
      }
    end

    def respond_to_missing?(meffod)
      logger.respond_to?(meffod) && !REFUSE_TO_FORWARD.include?(meffod)
    end

    def method_missing(meffod, *args)
      return super if REFUSE_TO_FORWARD.include?(meffod)

      if block_given?
        logger.public_send(meffod, *args, &Proc.new)
      else
        logger.public_send(meffod, *args)
      end
    end

    private
    attr_accessor :hostname, :logger, :program_name
  end
end
