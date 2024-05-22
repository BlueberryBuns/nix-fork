{ pkgs, stylix, username, ... }:

{
  imports = [
    stylix.nixosModules.stylix
  ];

  stylix.image = ../../assets/backgrounds/porthole.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  stylix.polarity = "dark"; # "light" or "either"

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "Hasklig" ]; };
      name = "Hasklug Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  stylix.fonts.sizes = {
    applications = 12;
    terminal = 15;
    desktop = 10;
    popups = 10;
  };

  stylix.opacity = {
    applications = 1.0;
    terminal = 1.0;
    desktop = 1.0;
    popups = 1.0;
  };

  # Exclude these from stylix
  home-manager.users.${username} = {
    stylix.targets = {
      vim.enable = false;
      alacritty.enable = false;
    };
  };

}

