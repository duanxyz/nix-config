{
  programs.zen-browser.profiles."default" = {
    containersForce = true;
    containers = {
      coding = {
        name = "Coding";
        color = "blue";
        icon = "briefcase";
        id = 1;
      };
      nix = {
        name = "Nix";
        color = "turquoise";
        icon = "tree";
        id = 2;
      };
      ai-gen = {
        name = "AI-General";
        color = "purple";
        icon = "circle";
        id = 3;
      };
      ai-alt = {
        name = "AI-Alt";
        color = "pink";
        icon = "circle";
        id = 4;
      };
      research = {
        name = "Research";
        color = "green";
        icon = "chill";
        id = 5;
      };
      crypto = {
        name = "Crypto";
        color = "orange";
        icon = "dollar";
        id = 6;
      };
      trader = {
        name = "Trader";
        color = "red";
        icon = "cart";
        id = 7;
      };
      youtube = {
        name = "YouTube";
        color = "red";
        icon = "vacation";
        id = 8;
      };
      spotify = {
        name = "Spotify";
        color = "green";
        icon = "fruit";
        id = 9;
      };
      personal = {
        name = "Personal";
        color = "toolbar";
        icon = "fingerprint";
        id = 10;
      };
    };
  };
}
