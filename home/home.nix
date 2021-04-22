{ pkgs, lib, ... }: {


imports = [ 
#         ./polybar.nix
         ./mails.nix

         ];


home.packages = with pkgs; [
    feh
    meld
    vlc
    nerdfonts
    font-awesome
    python3
    fira-code
    neovim
    neomutt
    htop
    evince
  ];


home.keyboard = {
    layout = "fr";
};

xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
};



  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };

fonts.fontconfig.enable = true;


services.polybar = {
  enable = true;
  package = pkgs.polybar.override {
     #i3GapsSupport = true;
     i3Support = true;
};


script = "polybar -q PolybarTony &";

};


#services.picom.enable= true; 

programs.bash = {
   enable = true;
   shellAliases = 
       { 
         vim = "nvim";
         mutt = "neomutt";
	 };
   
   bashrcExtra = "set -o vi";
};
services.picom = {
    enable = true;
    #package = pkgs.callPackage ../packages/compton-unstable.nix { };
    experimentalBackends = true;

    blur = true;
    blurExclude = [ "window_type = 'dock'" "window_type = 'desktop'" ];

    fade = true;
    fadeDelta = 5;

    shadow = true;
    shadowOffsets = [ (-7) (-7) ];
    shadowOpacity = "0.7";
    shadowExclude = [ "window_type *= 'normal' && ! name ~= ''" ];
    noDockShadow = true;
    noDNDShadow = true;

    activeOpacity = "1.0";
    inactiveOpacity = "0.8";
    menuOpacity = "0.8";

    backend = "glx";
    vSync = true;

    extraOptions = ''
      shadow-radius = 7;
      clear-shadow = true;
      frame-opacity = 0.7;
      blur-method = "dual_kawase";
      blur-strength = 5;
      alpha-step = 0.06;
      detect-client-opacity = true;
      detect-rounded-corners = true;
      paint-on-overlay = true;
      detect-transient = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
    '';
  };




xsession.enable = true;
programs.rofi.enable = true;


xdg.configFile = {
"i3/config".source = lib.mkForce /home/julien/.config/i3/config2;
"polybar/config".source = lib.mkForce /home/julien/.config/polybar/config2;
"gtk-3.0/settings.ini".source = lib.mkForce /home/julien/set.ini;
};

}
