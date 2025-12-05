{ common, lib, ... }:
{
  trivaris = {
    infos.hashedPassword = "$y$j9T$ZYnirABSLjZi.mfiKE.Si0$Fe67Vw2MHKtZybsHVGf0rNqcnN67LgLdsCbM8q6ln/B";
    prefs = {
      inherit (common.home)
        appLauncher
        git
        librewolf
        shell
        terminalEmulator
        ;

      desktopEnvironment = "hyprland";
      thunderbird.enable = true;
      prismlauncher.enable = true;
      email.enable = true;
      cli.enable = true;
      waybar.weatherLocation = "darmstadt";
      hyprland.wallpapers = [ (lib.mkStorePath "resources/wallpapers/nix2.png") ];
      misc = {
        otherPrograms = common.home.misc.otherPrograms ++ [ "java" ];
        otherPackages._general = common.home.misc.otherPackages._general ++ [
          # System Verilog
          "iverilog"
          "gtkwave"
          "yosys"
          "graphviz"
          
          # Java
          "gradle_8"
          "glib"
          "google-java-format"
          
          # Rust
          "cargo"
          "rustc"
          "rustfmt"
          "clippy"
          "rust-analyzer"
          "gcc"
        ];
      };
    };
  };
}
