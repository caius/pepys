module Pepys
  class Formatter
    LEVEL_MAPPINGS = {
      "FATAL" => 60,
      "ERROR" => 50,
      "WARN"  => 40,
      "INFO"  => 30,
      "DEBUG" => 20,
      # "TRACE" => 10,
    }

    FORMAT_VERSION = 0

    attr_reader :logger

    def initialize(logger)
      self.logger = logger
    end

    def call(level, timestamp, name, message)
      data = logger.base_fields.merge(
        level: level_number(level),
        time: timestamp.utc.iso8601,
        msg: message,
        v: FORMAT_VERSION,
      )

      # Only override the default name if we have a value
      data[:name] = name if name

      JSON.dump(data)
    end

    private

    attr_writer :logger

    def level_number(name)
      # Defaults to INFO if unknown
      LEVEL_MAPPINGS.fetch(name, 30)
    end
  end
end
