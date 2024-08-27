{
  # Load AMD GPU driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable AMD GPU kernel module
  boot = {
    kernelModules = [ "amdgpu" ];
    initrd.kernelModules = [ "amdgpu" ];
  };
}
