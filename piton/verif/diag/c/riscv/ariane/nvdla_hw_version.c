#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_cfgrom.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"
#include "../piton/verif/diag/c/riscv/ariane/mmio.h"

#define NVDLA_BASE 0xfff0e00000
#define reg_write(addr,val) reg_write32(NVDLA_BASE+addr,val)
#define reg_read(addr) reg_read32(NVDLA_BASE+addr)

// Test to access hardware version number on NVDLA
int main(int argc, char ** argv) {
  const REAL_HW_VERSION = 0x00010001;
  reg_write(CFGROM_HW_VERSION, REAL_HW_VERSION + 1); //should not change
  unsigned int HW_VERSION = reg_read(CFGROM_HW_VERSION);
  printf("TEST %sED\n", HW_VERSION == REAL_HW_VERSION ? "PASS" : "FAIL");
  return 0;
}
