module ThorExtend
  class CommandWrapper
    attr_reader :command

    def initialize(cmd)
      @command = cmd
    end

    def add(option_name, args)
      @command.options[option_name] = Thor::Option.new(option_name, {})
    end
  end
end
