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

    it 'returns nil if command was not found' do
      expect(extender.command('something')).to be nil
    end

    it 'returns a specific Thor command' do
      expect(extender.command('my_example')).to be_a_kind_of ThorExtend::CommandWrapper
    end

    context 'the returned wrapper' do
      it 'contains the actual command' do
        expect(extender.command('my_example').command).to be_a_kind_of(Thor::Command)
      end
    end
  end

  describe "#add" do
    let(:test_class) { example_cli }
    subject(:extender) { ThorExtend::OptionExtender.new(test_class) }

    it 'raises if option_name is nil' do
      expect { extender.command('my_example').add(nil, {}) }.to raise_error(ArgumentError)
    end

    it 'adds a new option' do
      extender.command('my_example').add(:new_opt, {})
      expect(test_class.commands["my_example"].options.has_key?(:new_opt)).to be true
    end

    it 'adds a new option given as string' do
      extender.command('my_example').add('new_opt', {})
      expect(test_class.commands["my_example"].options.has_key?(:new_opt)).to be true
    end
  end
end

