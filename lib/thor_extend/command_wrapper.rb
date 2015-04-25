module ThorExtend
  class CommandWrapper
    attr_reader :command

    def initialize(cmd)
      @command = cmd
    end

    def add(option_name, args)
      raise ArgumentError if option_name.nil?
      @command.options[option_name.to_sym] = Thor::Option.new(option_name.to_sym, {})
    end
  end
end
