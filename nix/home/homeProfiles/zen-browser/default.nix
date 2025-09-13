{
  inputs,
  cell,
}:
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    profiles."default" = {
      id = 0;
      isDefault = true;
    };

    policies =
      let
        mkExtensionSettings = builtins.mapAttrs (
          _: pluginId: {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
            installation_mode = "force_installed";
          }
        );

        mkLockedAttrs = builtins.mapAttrs (
          _: value: {
            Value = value;
            Status = "locked";
          }
        );
      in
      {
        ExtensionSettings = mkExtensionSettings {
          "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}" = "traduzir-paginas-web";
          "uBlock0@raymondhill.net" = "ublock-origin";
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
          "tridactyl.vim@cmcaine.co.uk" = "tridactyl-vim";
        };

        Preferences = mkLockedAttrs {
          "network.trr.excluded-domains" = "localhost,local,lan";
          "network.trr.bootstrapAddress" = "1.1.1.1";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.urlbar.suggest.searches" = false;
          "browser.tabs.loadBookmarksInTab" = true;
        };

        DNSOverHTTPS = {
          Enabled = true;
          Locked = true;
          Provider = "Custom";
          ProviderURL = "https://cloudflare-dns.com/dns-query";
          Fallback = false;
        };

        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true; # save webs for later reading
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        # NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        # find more options here: https://mozilla.github.io/policy-templates/
      };
  };
}
