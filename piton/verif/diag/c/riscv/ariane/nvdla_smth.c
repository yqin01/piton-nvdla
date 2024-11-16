#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_glb.h"
#include "../piton/verif/diag/c/riscv/ariane/mmio.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla_cdp.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla_cdp_rdma.h"

#define NVDLA_BASE 0xfff0e00000
#define reg_write(addr,val) reg_write32(NVDLA_BASE+addr,val)
#define reg_read(addr) reg_read32(NVDLA_BASE+addr)

int main(int argc, char ** argv) {
  unsigned int HW_VERSION = reg_read(CDP_S_LUT_ACCESS_DATA);
  
  printf("HW Version: %08x\n", HW_VERSION);
  unsigned int old = reg_read(CDP_RDMA_D_DATA_CUBE_HEIGHT);
  printf("Old: %08x\n", old);
  reg_write(CDP_RDMA_D_DATA_CUBE_HEIGHT, 0x7);
  unsigned int new = reg_read(CDP_RDMA_D_DATA_CUBE_HEIGHT);
  printf("New: %08x\n", new);
  return 0;
}
