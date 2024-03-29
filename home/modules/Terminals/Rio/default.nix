{...}: {
  programs.rio = {
    enable = true;
    settings = {
      cursor = "|";
      blinking-cursor = true;
      performance = "High";
      background = {
        opacity = 0.1;
      };
      fonts = {
        size = 12;
        regular = {
          family = "Lilex Nerd Font"; # Uncomment when nixpkgs updates rio to 0.20 for font config
        };
      };
      colors = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        selection-background = "#585b70";
        selection-foreground = "#cdd6f4";
        cursor = "#f5e0dc";
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
        light_black = "#585b70";
        light_red = "#f38ba8";
        light_green = "#a6e3a1";
        light_yellow = "#f9e2af";
        light_blue = "#89b4fa";
        light_magenta = "#f5c2e7";
        light_cyan = "#94e2d5";
        light_white = "#a6adc8";
      };
    };
  };
}
