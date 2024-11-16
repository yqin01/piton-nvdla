#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_glb.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"
#include "../piton/verif/diag/c/riscv/ariane/mmio.h"
#define NVDLA_BASE 0xfff0e00000
#define reg_write(addr,val) reg_write32(NVDLA_BASE+addr,val)
#define reg_read(addr) reg_read32(NVDLA_BASE+addr)

// updates NVDLA interrupt mask and checks that change is reflected
int main(int argc, char ** argv) {
  unsigned int old = reg_read(GLB_INTR_MASK);
  printf("INTR_MASK %08x\n", old);

  reg_write(GLB_INTR_MASK, old + 1);

  unsigned int new = reg_read(GLB_INTR_MASK);
  printf("INTR_MASK %08x\n", new);

  printf("TEST %sED\n", old + 1 == new ? "PASS" : "FAIL");
  return 0;
}
