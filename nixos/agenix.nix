{
  inputs,
  ...
}:
{
  imports = [ inputs.agenix.nixosModules.default ];

  age.identityPaths = [ "/var/lib/key.txt" ];

  age.secrets = {
    duan.file = ../secrets/duan.age;
    root.file = ../secrets/root.age;
    hermes-env = {
      file = ../secrets/hermes-env.age;
      owner = "duan";
    };
  };
}
