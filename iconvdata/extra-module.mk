mod := $(firstword $(extra-modules-left))
extra-modules-left := $(strip $(filter-out $(mod),$(extra-modules-left)))

extra-objs := $(extra-objs) $(patsubst %,%.o_shared,$($(mod)-routines))

$(objpfx)$(mod).so: $(addprefix $(objpfx),$(addsuffix .o_shared,$($(mod)-routines)))\
		    $(shlib-lds) $(link-libc-deps)
	$(build-module-asneeded)

ifneq (,$(extra-modules-left))
include extra-module.mk
endif
