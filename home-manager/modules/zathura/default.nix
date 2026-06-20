{ ... }: {
  programs.zathura = {
    enable = true;
    options = {
      font = "JetBrainsMono Nerd Font 12";
      show-recent = 3;
      default-bg = "#1d2021";
      default-fg = "#ebdbb2";
      statusbar-bg = "#1d2021";
      statusbar-fg = "#ebdbb2";
      inputbar-bg = "#282828";
      inputbar-fg = "#ebdbb2";
      notification-bg = "#3c3836";
      notification-fg = "#ebdbb2";
      notification-error-bg = "#cc241d";
      notification-error-fg = "#fbf1c7";
      notification-warning-bg = "#d79921";
      notification-warning-fg = "#282828";
      highlight-color = "#83a598";
      highlight-fg = "#282828";
      highlight-active-color = "#282828";
      completion-bg = "#282828";
      completion-fg = "#ebdbb2";
      completion-highlight-fg = "#282828";
      completion-highlight-bg = "#83a598";
      completion-group-bg = "#282828";
      completion-group-fg = "#83a498";
      scroll-step = 50;
      render-loading = true;
      recolor = true;
      recolor-keephue = true;
      recolor-lightcolor = "#1d2021";
      statusbar-h-padding = 5;
      statusbar-v-padding = 2;
      selection-clipboard = "clipboard";
      guioptions = "none";
    };
  };

  xdg.configFile."gtk-3.0/gtk.css".text = ''
    headerbar.default-decoration {
      background-color: #1d2021;
      border-bottom: 1px solid #3c3836;
    }
    headerbar.default-decoration label {
      color: #ebdbb2;
    }
  '';
}
