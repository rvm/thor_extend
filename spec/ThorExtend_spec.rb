require 'spec_helper'
require 'ThorExtend/command_wrapper'
require 'thor'

class ExampleCLI < Thor
end

describe ThorExtend do
  it 'has a version number' do
    expect(ThorExtend::VERSION).not_to be nil
  end

  describe '#initialize' do
    it 'accepts a cli class' do
      expect { ThorExtend::OptionExtender.new(ExampleCLI) }.to_not raise_error
    end
  end

  describe "#command" do
    subject(:extender) { ThorExtend::OptionExtender.new(ExampleCLI) }

    it 'returns a specific Thor command' do
      expect(extender.command('my_command')).to be_a_kind_of ThorExtend::CommandWrapper
    end
  end

  # describe "#add" do
  #   subject(:extender) { ThorExtend::OptionExtender.new(ExampleCLI) }

  #   it 'adds a new option' do
  #     extender.command('my_command').add(:new_opt, {}).add(:new_opt, {})
  #   end
  # end
end

