require 'spec_helper'
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
end

