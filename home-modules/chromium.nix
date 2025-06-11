{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      # uBlock Origin Lite
      "ddkjiahejlhfcafbddmgiahcphecmpfh"
      # Bitwarden
      "nngceckbapebfimnlniiiahkandclblb"
      # Vimium
      "dbepggeogbaibhgnhhndojpepiihcmeb"
      # Accept all cookies
      "ofpnikijgfhlmmjlpkfaifhhdonchhoi"
    ];
  };
}
