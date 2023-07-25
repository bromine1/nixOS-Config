{
  inputs,
  self,
  user,
  nvidia,
  ...
}: {
  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
    extraConfig = ''
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = LIBVA_DRIVER_NAME,nvidia
      env = WLR_NO_HARDWARE_CURSORS,1
    '';
  };
  imports = [./default.nix];
}
