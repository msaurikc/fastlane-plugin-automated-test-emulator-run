$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# This module is only used to check the environment is currently a testing env
module SpecHelper
end

require 'fastlane' # to import the Action super class
require 'fastlane/plugin/automated_test_emulator_run' # import the actual plugin

Fastlane.load_actions # load other actions (in case your plugin calls other actions or shared values)

def setup_sdk_fixture
  @fake_sdk_path = './fixtures'
  FileUtils.mkdir_p(%W[#{@fake_sdk_path}/cmdline-tools/latest/bin #{@fake_sdk_path}/tools/bin #{@fake_sdk_path}/platform-tools #{@fake_sdk_path}/emulator])
  FileUtils.touch %W[#{@fake_sdk_path}/cmdline-tools/latest/bin/avdmanager #{@fake_sdk_path}/tools/bin/avdmanager]
end

def remove_sdk_fixture
  FileUtils.rm_rf @fake_sdk_path
end
