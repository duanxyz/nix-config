{ config }:
{
  programs.zen-browser.profiles."default" = {
    spacesForce = true;
    spaces =
      let
        containers = config.programs.zen-browser.profiles."default".containers;
      in
      {
        coding = {
          id = "8ed11c7e-bbd7-423a-9dc2-3b5810cc39e1";
          name = "Coding";
          icon = "💻";
          position = 1000;
          container = containers."coding".id;
          theme = {
            type = "gradient";
            colors = [
              {
                red = 142;
                green = 236;
                blue = 245;
              }
            ];
          };
        };

        ai = {
          id = "8aec4a5f-93c4-4985-89a1-88afd9eecb26";
          name = "AI";
          icon = "🤖";
          position = 2000;
          container = containers."ai-gen".id;
          theme = {
            type = "gradient";
            colors = [
              {
                red = 207;
                green = 186;
                blue = 240;
              }
            ];
          };
        };

        research = {
          id = "6c2fa38e-9086-4620-a7b2-091580165c25";
          name = "Research";
          icon = "🔎";
          position = 3000;
          container = containers."research".id;
          theme = {
            type = "gradient";
            colors = [
              {
                red = 152;
                green = 245;
                blue = 225;
              }
            ];
          };
        };

        media = {
          id = "9c53f5f0-4a4e-400e-b374-dc221f42356c";
          name = "Media";
          icon = "🎵";
          position = 4000;
          container = containers."youtube".id;
          theme = {
            type = "gradient";
            colors = [
              {
                red = 255;
                green = 207;
                blue = 210;
              }
            ];
          };
        };

        personal = {
          id = "f50c1e8d-878d-421e-bc95-bebf20e3b179";
          name = "Personal";
          icon = "👤";
          position = 5000;
          container = containers."personal".id;
          theme = {
            type = "gradient";
            colors = [
              {
                red = 241;
                green = 192;
                blue = 232;
              }
            ];
          };
        };

        finance = {
          id = "db2fb375-fba0-4caf-adae-3fd5454721cb";
          name = "Finance";
          icon = "💰";
          position = 6000;
          container = containers."crypto".id;
          theme = {
            type = "gradient";
            colors = [
              {
                red = 253;
                green = 228;
                blue = 207;
              }
            ];
          };
        };
      };
  };
}
