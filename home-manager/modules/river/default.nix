{ ... }: {
  xdg.configFile."river/init" = {
    source = ./init;
  };
  xdg.configFile."river/env.sh" = {
    source = ./env.sh;
  };
}
