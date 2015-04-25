module ThorExtend
  class CommandWrapper
    attr_reader :command

    def initialize(cmd)
      @command = cmd
    end
  end
end
