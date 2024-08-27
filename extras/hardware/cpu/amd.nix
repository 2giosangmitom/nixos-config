{
  hardware.cpu.amd.updateMicrocode = true;

  boot.kernelModules = [
    "kvm-amd"
    "amd-pstate"
  ];
}
