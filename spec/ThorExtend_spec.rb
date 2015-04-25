require 'spec_helper'
require 'thor_extend/command_wrapper'
require 'thor'

describe ThorExtend do
  def example_cli
    Class.new(Thor) do
      desc "foo", "bar"
      def my_example
      end
    end
  end
  it 'has a version number' do
    expect(ThorExtend::VERSION).not_to be nil
  end

  describe '#initialize' do
    it 'accepts a cli class' do
      expect { ThorExtend::OptionExtender.new(example_cli) }.to_not raise_error
    end
  end

  describe "#command" do
    subject(:extender) { ThorExtend::OptionExtender.new(example_cli) }

    it 'returns a specific Thor command' do
      expect(extender.command('my_command')).to be_a_kind_of ThorExtend::CommandWrapper
    end

    context 'the returned wrapper' do
      it 'contains the actual command' do
        expect(extender.command('my_example').command).to be_a_kind_of(Thor::Command)
      end
    end
  end

  # describe "#add" do
  #   subject(:extender) { ThorExtend::OptionExtender.new(ExampleCLI) }

  #   it 'adds a new option' do
  #     extender.command('my_command').add(:new_opt, {})
  #     expect(ExampleCLI.commands["my_example"].options.has_key?(:new_opt)).to be true
  #   end
  # end
end

