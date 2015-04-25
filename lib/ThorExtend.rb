require "ThorExtend/version"

module ThorExtend
  class OptionExtender
    def initialize(klass)
      @klass = klass
    end

    def command(name)
      ThorExtend::CommandWrapper.new
    end
  end
end
