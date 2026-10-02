_: {
  services.journald.settings.Journal = {
    SystemMaxUse = "500M";
    SystemMaxFileSize = "50M";
    MaxRetentionSec = "1month";
  };
}
