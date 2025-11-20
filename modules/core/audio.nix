{pkgs, ...}: {
  hardware.pulseaudio.enable = false; # Use pipewire, the modern sound subsystem
  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes

  # audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    # Copypasted from ZaneyOS
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 256;
        "default.clock.min-quantum" = 256;
        "default.clock.max-quantum" = 256;
      };
    };

    # Copypasted from ZaneyOS
    extraConfig.pipewire-pulse."92-low-latency" = {
      context.modules = [
        {
          name = "libpipewire-module-protocol-pulse";
          args = {
            pulse.min.req = "256/48000";
            pulse.default.req = "256/48000";
            pulse.max.req = "256/48000";
            pulse.min.quantum = "256/48000";
            pulse.max.quantum = "256/48000";
          };
        }
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    pavucontrol # PulseAudio Volume Control
    pamixer # Command-line mixer for PulseAudio
    bluez # Bluetooth support
    bluez-tools # Bluetooth tools
  ];
}
