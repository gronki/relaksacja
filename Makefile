CC  	 	 	?= cc
FC 		 	 	:= $(if $(filter $(FC),f77),f95 -fimplicit-none,$(FC))

CFLAGS			?= -O3 -mieee-fp -g -march=native
FFLAGS 			?= -O3 -mieee-fp -g -march=native
FFLAGS 			+= -std=f2008 -fimplicit-none

INCLUDE	 	 	= -I.
COMPILE.C 	 	= $(CC) $(INCLUDE) $(CPPFLAGS) -g $(CFLAGS) -c
COMPILE.F    	= $(FC) $(INCLUDE) $(CPPFLAGS) -g $(FFLAGS) -c
LINK.C 	 	 	= $(CC) $(INCLUDE) $(CPPFLAGS) -g $(CFLAGS) $(LDFLAGS)
LINK.F    	 	= $(FC) $(INCLUDE) $(CPPFLAGS) -g $(FFLAGS) $(LDFLAGS)
LINK         	= $(LD) --build-id $(LDFLAGS)

rysunek.png: euler.dat exact.dat relax.dat
	python plot.py $@ $^

%.dat: %.bin
	./$<

%.bin: common.o %.F90
	$(LINK.F) $^ $(LDLIBS) -o $@

%.o: %.F90
	$(COMPILE.F) $< -o $@
%.o: %.c
	$(COMPILE.C) $< -o $@

clean:
	rm -rvf *.o *.mod *.bin *.png *.dat

distclean: clean
