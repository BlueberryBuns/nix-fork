{ config, pkgs, inputs, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  dotfiles = inputs.dotfiles;
in
{
  home.packages = with pkgs; [ neovim ];

  xdg.desktopEntries."nvim" = {
    name = "nvim";
    comment = "Edit text files";
    icon = "nvim";
    exec = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.neovim}/bin/nvim %F";
    categories = [ "TerminalEmulator" ];
    terminal = false;
    mimeType = [ "text/plain" ];
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "nvim" ];
  };

  xdg.configFile = {
    "nvim/init.lua" = { source = mkOutOfStoreSymlink "${config.home.homeDirectory}/git/nix/dotfiles/.config/nvim/init.lua"; };
    "nvim/lazy-lock.json" = { source = mkOutOfStoreSymlink "${config.home.homeDirectory}/git/nix/dotfiles/.config/nvim/lazy-lock.json"; };
    "nvim/.stylua.toml" = { source = mkOutOfStoreSymlink "${config.home.homeDirectory}/git/nix/dotfiles/.config/nvim/.stylua.toml"; };
    "nvim/lua" = { source = mkOutOfStoreSymlink "${config.home.homeDirectory}/git/nix/dotfiles/.config/nvim/lua"; };
    "nvim/spell" = { source = mkOutOfStoreSymlink "${config.home.homeDirectory}/git/nix/dotfiles/.config/nvim/spell"; };
    "nvim/after" = { source = mkOutOfStoreSymlink "${config.home.homeDirectory}/git/nix/dotfiles/.config/nvim/after"; };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    vimdiff = "nvim -d";
  };
}