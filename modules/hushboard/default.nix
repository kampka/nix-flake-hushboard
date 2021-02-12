{ hushboard }:

{
  config = {
    systemd.user.services.hushboard = {
      description = "Mute your mic while you’re typing";
      restartIfChanged = true;

      wantedBy = [ "default.target" ];
      after = [ "graphical-session.target" ];
      unitConfig = {
        ConditionUser = "!@system";
      };

      serviceConfig = {
        Restart = "on-failure";
        ExecStart = "${hushboard}/bin/hushboard";
      };
    };
  };
}
