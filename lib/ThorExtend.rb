require "thor_extend/version"

module ThorExtend
  class OptionExtender
    def initialize(klass)
      @klass = klass
    end

    def command(name)
      ThorExtend::CommandWrapper.new(@klass.commands[name])
    end
  end
end
