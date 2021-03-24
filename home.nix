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
    python3
  ];

  home.keyboard = {
    layout = "fr";
};

 xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    
};


#services.polybar = {
 # enable = true;
  
  #package = pkgs.polybar.override {

   #    i3Support = true;
    #   alsaSupport = true;
      # i3GapsSupport = true;
#};


#script = "polybar -q PolybarTony";

#};


services.picom.enable= true; 



xsession.enable = true;
programs.rofi.enable = true ;

#xdg.enable = true;

xdg.configFile = {
"i3/config".source = lib.mkForce /home/julien/.config/i3/config2;

#"polybar/config".source = lib.mkForce /home/julien/.config/polybar/config2;

};


# home.file.".config/i3/config".source = /home/julien/.config/i3/config2;


}
