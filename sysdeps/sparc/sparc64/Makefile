sysdep-CFLAGS += -Wa,-Av9a -mvis

ifeq ($(subdir),string)
sysdep_routines += align-cpy
endif

ASFLAGS-.o += -Wa,-Av9d
ASFLAGS-.o_shared += -Wa,-Av9d
ASFLAGS-.op += -Wa,-Av9d
ASFLAGS-.o_static += -Wa,-Av9d

# nscd uses atomic_spin_nop which in turn requires cpu_relax
ifeq ($(subdir),nscd)
routines += cpu_relax
endif

ifeq ($(subdir),nptl)
libpthread-routines += cpu_relax
endif
