{
  programs.zen-browser.profiles."default".bookmarks = {
    force = true;
    settings = [
      {
        name = "Nix sites";
        toolbar = true;
        bookmarks = [
          {
            name = "nixos";
            url = "https://nixos.org/";
          }
          {
            name = "wiki";
            tags = [
              "wiki"
              "nix"
            ];
            url = "https://wiki.nixos.org/";
          }
          {
            name = "home-manager";
            tags = [ "nix" ];
            url = "https://home-manager-options.extranix.com/";
          }
          {
            name = "search";
            tags = [ "nix" ];
            url = "https://search.nixos.org/packages?channel=unstable&";
          }
        ];
      }
      {
        name = "Ai sites";
        toolbar = true;
        bookmarks = [
          {
            name = "chatgpt";
            tags = [ "ai" ];
            url = "https://chatgpt.com/";
          }
          {
            name = "gemini";
            tags = [ "ai" ];
            url = "https://gemini.google.com/app";
          }
          {
            name = "deepseek";
            tags = [ "ai" ];
            url = "https://chat.deepseek.com/";
          }
        ];
      }
    ];
  };
}
