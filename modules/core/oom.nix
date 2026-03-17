{...}: {
  systemd.oomd = {
    enableUserSlices = true;
    settings.OOM = {
      SwapUsedLimit = "90%";
      DefaultMemoryPressureLimit = "80%";
      DefaultMemoryPressureDurationSec = "20s";
    };
  };
}
