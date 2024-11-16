#include <stdio.h>
#include "../piton/verif/diag/c/riscv/ariane/nvdla_cdma.h"
#include "../piton/verif/diag/c/riscv/ariane/nvdla.h"

// load up and run Convolution Direct Memory Access Stage
int main(int argc, char ** argv) {
  unsigned int data_addr = 0x10000000;

  *(BASE_ADDR + CDMA_D_DATAIN_SIZE_0) = 1;
  *(BASE_ADDR + CDMA_D_DATAIN_SIZE_1) = 1;
  *(BASE_ADDR + CDMA_D_DAIN_ADDR_HIGH_0) = 0;
  *(BASE_ADDR + CDMA_D_DAIN_ADDR_LOW_1) = data_addr;
  *(BASE_ADDR + CDMA_D_DAIN_ADDR_HIGH_0) = 0;
  *(BASE_ADDR + CDMA_D_DAIN_ADDR_LOW_1) = data_addr;

  *(BASE_ADDR + CDMA_D_WEIGHT_SIZE_0) = 1;
  *(BASE_ADDR + CDMA_D_WEIGHT_SIZE_1) = 1;
  *(BASE_ADDR + CDMA_D_WEIGHT_ADDR_HIGH) = 0;
  *(BASE_ADDR + CDMA_D_WEIGHT_ADDR_LOW) = data_addr;
  *(BASE_ADDR + CDMA_D_WEIGHT_BYTES) = 1;

  *(BASE_ADDR + CDMA_D_WGS_ADDR_HIGH) = 0;
  *(BASE_ADDR + CDMA_D_WGS_ADDR_LOW) = data_addr;
  *(BASE_ADDR + CDMA_D_WMB_ADDR_HIGH) = 0;
  *(BASE_ADDR + CDMA_D_WMB_ADDR_LOW) = data_addr;
  *(BASE_ADDR + CDMA_D_WMB_BYTES) = 1;

  *(BASE_ADDR + CDMA_D_CVT_CFG) = 0; // disable convertor
  *(BASE_ADDR + CDMA_D_PERF_ENABLE) = 0; // disable perf
  *(BASE_ADDR + CDMA_D_NAN_FLUSH_TO_ZERO) = 1; // replace NAN with 0


  *(BASE_ADDR + CDMA_D_OP_ENABLE) = 1; // kick off execution
  printf("Started execution\nWaiting for completion\n");
  while (*(BASE_ADDR + CDMA_D_OP_ENABLE)); //wait for hardware to de-enable
  printf("TEST PASSED\n");
  return 0;
}
