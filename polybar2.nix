{ pkgs, ... }:

# Created By @icanwalkonwater
# Edited and ported to Nix by Th0rgal

{
  services.polybar = {
    enable = true;

    package = (pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
    }).overrideAttrs(_:{propagatedBuildInputs = [pkgs.python3];}); 

    script = "MONITOR=HDMI-A-0 polybar arctic & MONITOR=HDMI-A-1 polybar arctic";

  };
}
