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
        "#{@sdk_root}/platform-tools/adb"
      end

      def avdmanager
        "#{cmdline_tools_path}/avdmanager"
      end

      def sdkmanager
        "#{cmdline_tools_path}/sdkmanager"
      end

      def emulator_path
        "#{@sdk_root}/emulator"
      end

    end
  end
end
