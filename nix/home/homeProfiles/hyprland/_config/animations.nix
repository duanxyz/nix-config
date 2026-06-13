{
  config = {
    animations = {
      enabled = true;
      workspace_wraparound = true;
    };
  };

  curve = [
    {
      _args = [
        "overshot"
        {
          type = "bezier";
          points = [
            [
              0.32
              0.72
            ]
            [
              0.38
              1.1
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "linear"
        {
          type = "bezier";
          points = [
            [
              0
              0
            ]
            [
              1
              1
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "wind"
        {
          type = "bezier";
          points = [
            [
              0.05
              0.9
            ]
            [
              0.1
              1.05
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "winIn"
        {
          type = "bezier";
          points = [
            [
              0.1
              1.1
            ]
            [
              0.1
              1.1
            ]
          ];
        }
      ];
    }
    {
      _args = [
        "winOut"
        {
          type = "bezier";
          points = [
            [
              0.3
              (-0.3)
            ]
            [
              0
              1
            ]
          ];
        }
      ];
    }
  ];

  animation = [
    {
      leaf = "windows";
      enabled = true;
      speed = 4;
      bezier = "wind";
      style = "slide";
    }
    {
      leaf = "windowsIn";
      enabled = true;
      speed = 4;
      bezier = "winIn";
      style = "slide";
    }
    {
      leaf = "windowsOut";
      enabled = true;
      speed = 4;
      bezier = "winOut";
      style = "slide";
    }
    {
      leaf = "fade";
      enabled = true;
      speed = 4;
      bezier = "overshot";
    }
    {
      leaf = "workspaces";
      enabled = true;
      speed = 4;
      bezier = "wind";
      style = "slidevert";
    }
    {
      leaf = "border";
      enabled = true;
      speed = 10;
      bezier = "linear";
    }
  ];
}
