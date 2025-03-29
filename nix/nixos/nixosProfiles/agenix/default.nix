{
  inputs,
  cell,
}:
{
  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = {
    root.file = inputs.self + /secrets/root.age;
    duan.file = inputs.self + /secrets/duan.age;
  };
}
