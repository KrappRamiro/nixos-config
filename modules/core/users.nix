{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krapp = {
    isNormalUser = true;
    description = "Ramiro Krapp";
    extraGroups = ["networkmanager" "wheel" "video"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
