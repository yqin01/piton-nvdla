#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_cdma.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"

// tests proper functioning of ping-pong system
int main(int argc, char ** argv) {
  unsigned int old = *(BASE_ADDR + CDMA_D_MISC_CFG);
  printf("CDMA_D_MISC_CFG %08x\n", old);

  *(BASE_ADDR + CDMA_S_POINTER) = -1;
  *(BASE_ADDR + CDMA_D_MISC_CFG) += 1;
  *(BASE_ADDR + CDMA_S_POINTER) = 0;

  unsigned int new = *(BASE_ADDR + CDMA_D_MISC_CFG); 
  printf("CDMA_D_MISC_CFG %08x\n", new);

  printf("TEST %sED\n", old == new ? "PASS" : "FAIL");
  return 0;
}
