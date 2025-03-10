module Fastlane
  module Factory

    class ADB_Controller
      attr_accessor :command_stop,
                    :command_start,
                    :command_get_devices,
                    :command_wait_for_device,
                    :command_get_avds,
                    :adb_path
    end

    class AdbControllerFactory

      def self.get_adb_controller(params)
        UI.message('Preparing commands for Android ADB'.yellow)

        # Get paths
        android_sdk_helper = Helper::AndroidSDKHelper.new(sdk_path: (params[:SDK_path]).to_s)
        path_avdmanager_binary = android_sdk_helper.avdmanager
        path_adb = android_sdk_helper.adb

        # ADB shell command parts
        sh_stop_adb = "kill-server"
        sh_start_adb = "start-server"
        sh_devices_adb = "devices"
        sh_wait_for_device_adb = "wait-for-device"
        sh_list_avd_adb = "list avd"

        # Assemble ADB controller
        adb_controller = ADB_Controller.new
        adb_controller.command_stop = [
          path_adb,
          sh_stop_adb
        ].join(" ")

        adb_controller.command_start = [
          path_adb,
          sh_start_adb
        ].join(" ")

        adb_controller.command_get_devices = [
          path_adb,
          sh_devices_adb
        ].join(" ")

        adb_controller.command_wait_for_device = [
          path_adb,
          sh_wait_for_device_adb
        ].join(" ")

        adb_controller.adb_path = path_adb

        adb_controller.command_get_avds = [
          path_avdmanager_binary,
          sh_list_avd_adb
        ].join(" ").chomp

        return adb_controller
      end
    end
  end
end
