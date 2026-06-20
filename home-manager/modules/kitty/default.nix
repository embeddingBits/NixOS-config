{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "IosevkaTerm Nerd Font";
      size = 14;
    };
    settings = {
      cursor_trail = 10;
      cursor_blink_interval = 0;
      confirm_os_window_close = 0;
      cursor_shape = "block";
      window_padding_width = "8 16";
      update_check_interval = 0;
      shell_integration = "disabled";

      background = "#1d2021";
      foreground = "#d4be98";
      selection_background = "#d4be98";
      selection_foreground = "#1d2021";
      cursor = "#a89984";
      cursor_text_color = "background";
      color0  = "#665c54";   color8  = "#928374";
      color1  = "#ea6962";   color9  = "#ea6962";
      color2  = "#a9b665";   color10 = "#a9b665";
      color3  = "#e78a4e";   color11 = "#d8a657";
      color4  = "#7daea3";   color12 = "#7daea3";
      color5  = "#d3869b";   color13 = "#d3869b";
      color6  = "#89b482";   color14 = "#89b482";
      color7  = "#d4be98";   color15 = "#d4be98";
      active_tab_foreground   = "#444444";
      active_tab_background   = "#d4be98";
      inactive_tab_foreground = "#d4be98";
      inactive_tab_background = "#171a1a";
    };
  };
}
