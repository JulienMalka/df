{ pkgs, lib, ... }: {


imports = [ 
         ./polybar.nix

         ];


  home.packages = with pkgs; [
    geany
    meld
    vlc
    nerdfonts
    font-awesome
    font-awesome_4
    python3
    signal-desktop
    spotify
    neomutt
    powerline-fonts
    transmission_gtk
    vlc
    terminus_font
  ];

  home.keyboard = {
    layout = "fr";
};

 xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    
};



programs.fish.enable = true;

services.picom.enable= true; 



xsession.enable = true;
programs.rofi.enable = true ;

#xdg.enable = true;

xdg.configFile = {
"i3/config".source = lib.mkForce /home/julien/.config/i3/config2;

"polybar/config".source = lib.mkForce /home/julien/.config/polybar/config3;

};




}
