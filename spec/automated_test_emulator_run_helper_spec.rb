require 'spec_helper'
require 'fastlane/plugin/automated_test_emulator_run/helper/android_sdk_helper'

describe Fastlane::Helper::AndroidSDKHelper do

  describe 'Android SDK Helper' do
    before do
      setup_sdk_fixture
    end

    it 'should return path cmdline-tools' do
      result = Fastlane::Helper::AndroidSDKHelper.new(sdk_path: @fake_sdk_path)
      expect(result.cmdline_tools_path).to eq "#{@fake_sdk_path}/cmdline-tools/latest/bin"
    end

    it 'should return path to legacy tools' do
      FileUtils.rm_rf "#{@fake_sdk_path}/cmdline-tools"
      result = Fastlane::Helper::AndroidSDKHelper.new(sdk_path: @fake_sdk_path)
      expect(Fastlane::UI).to receive(:message).with('Warning: Falling back to legacy tools path'.yellow)
      expect(result.cmdline_tools_path).to eq "#{@fake_sdk_path}/tools/bin"
    end
  end

  after do
    remove_sdk_fixture
  end

end
