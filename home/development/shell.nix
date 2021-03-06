{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bat
      file
      tree
    ];
  };

  programs = {

    bash = {
      enable = true;
      shellAliases = {
        glow = "${pkgs.glow}/bin/glow -p";
      };
      initExtra = ''
        source ${pkgs.posix-toolbox.ls-colors}/share/ls-colors/bash.sh
        if [ -r "$HOME/.private/bash_aliases" ]; then source "$HOME/.private/bash_aliases"; fi
      '';
    };

    htop = {
      enable = true;
      highlightBaseName = true;
    };

    tmux = {
      enable = true;
      keyMode = "vi";
      shortcut = "a";
      escapeTime = 0;
      plugins = with pkgs.tmuxPlugins; [
        continuum
        prefix-highlight
        sysstat
        tmux-colors-solarized
      ];
    };

    urxvt = {
      enable = true;
      fonts = [ "xft:Monospace:pixelsize=10" ];
    };
  };

}
