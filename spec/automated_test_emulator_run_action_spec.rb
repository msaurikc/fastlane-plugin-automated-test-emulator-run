describe Fastlane::Actions::AutomatedTestEmulatorRunAction do
  describe '#run' do
    it 'prints a message and raises an exception' do
      allow(Fastlane::UI).to receive(:message)
      expect { Fastlane::Actions::AutomatedTestEmulatorRunAction.run(AVD_setup_path: 'does_not_exist.json') }
        .to raise_exception('Lane was stopped by plugin')
      expect(Fastlane::UI).to have_received(:message).with("The automated_test_emulator_run plugin is working!")
    end
  end
end
