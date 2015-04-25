require "thor_extend/version"

module ThorExtend
  class OptionExtender
    def initialize(klass)
      @klass = klass
    end

    def command(name)
      cmd = @klass.commands[name]
      if cmd
        ThorExtend::CommandWrapper.new(cmd)
      else
        nil
      end
    end
  end
end
