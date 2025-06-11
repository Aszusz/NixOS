{ config, pkgs, ... }:

{
  # Git configuration
  programs.git = {
    enable = true;
    userName = "Adrian Szuszkiewicz";
    userEmail = "adrianszuszkiewicz@gmail.com";
  };
}
