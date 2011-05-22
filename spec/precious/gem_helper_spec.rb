require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe Precious do
  describe 'GemHelper' do
    it "should print to STDERR if Bundler's version has not yet been tested." do
      Bundler::VERSION = '1.1.0'

      mock(STDERR).puts("Warning! Precious has not been verified to work with Bundler point-releases, beyond 1.0. For everyone's safety, tasks are unavailable.")

      Precious::GemHelper
    end
  end
end
