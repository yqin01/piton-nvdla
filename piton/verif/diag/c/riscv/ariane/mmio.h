#ifndef __MMIO_H__
#define __MMIO_H__

#include <stdint.h>

static inline void reg_write32(uintptr_t addr, uint32_t data)
{
	volatile unsigned int *ptr = (unsigned int *) addr;
	*ptr = data;
}

static inline uint32_t reg_read32(uintptr_t addr)
{
	volatile unsigned int *ptr = (unsigned int *) addr;
	return *ptr;
}

#endif
