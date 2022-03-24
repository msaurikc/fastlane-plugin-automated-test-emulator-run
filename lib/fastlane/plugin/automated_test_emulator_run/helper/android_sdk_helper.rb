module Fastlane
  module Helper
    class AndroidSDKHelper
      attr_accessor :sdk_root

      def initialize(params)
        @sdk_root = params[:sdk_path].to_s
      end

      def cmdline_tools_path
        cmdline_tools = "#{@sdk_root}/cmdline-tools/latest/bin"
        if File.exist?(cmdline_tools)
          cmdline_tools
        else
          UI.message('Warning: Falling back to legacy tools path'.yellow)
          "#{@sdk_root}/tools/bin"
        end
      end

      def adb
        throw_error('Unable to find adb') if File.exist?("#{@sdk_root}/platform-tools/adb")
        "#{@sdk_root}/platform-tools/adb"
      end

      def avdmanager
        throw_error('Unable to find avdmanager') if File.exist?("#{cmdline_tools_path}/avdmanager")
        "#{cmdline_tools_path}/avdmanager"
      end

      def sdkmanager
        throw_error('Unable to find sdkmanager') if File.exist?("#{cmdline_tools_path}/sdkmanager")
        "#{cmdline_tools_path}/sdkmanager"
      end

      def emulator_path
        throw_error('Unable to find emulator path') if File.exist?("#{@sdk_root}/emulator")
        "#{@sdk_root}/emulator"
      end

      def self.throw_error(message)
        UI.message("Error: #{message}".red)
        raise StandardError, 'Lane was stopped by plugin'
      end

    end
  end
end
