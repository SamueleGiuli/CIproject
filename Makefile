FC:=mpif90
FFLAGS:= -O2

TSTDIR:=unittest
TSTBIN:=unittest/bin

GLOB_INC:=$(shell pkg-config --cflags dmft_ed dmft_tools scifor)
GLOB_LIB:=$(shell pkg-config --libs   dmft_ed dmft_tools scifor)

all: $(TSTBIN)
	ls -ra
	ls -ra ..

	SCIFORVER=$( ls /home/${USER}/opt/scifor/gnu)
	export PKG_CONFIG_PATH=/home/${USER}/opt/scifor/gnu/$(SCIFORVER)/etc/:$PKG_CONFIG_PATH
	source /home/${USER}/opt/scifor/gnu/${SCIFORVER}/bin/scifor_config_user.sh

	DMFTVER=$( ls /home/${USER}/opt/dmft_tools/gnu )
	export PKG_CONFIG_PATH=/home/${USER}/opt/dmft_tools/gnu/$(DMFTVER)/etc/:$PKG_CONFIG_PATH
	source /home/${USER}/opt/dmft_tools/gnu/${DMFTVER}/bin/dmft_tools_config_user.sh

	LIBEDVER=$( ls /home/${USER}/opt/dmft_ed )
	export PKG_CONFIG_PATH=/home/${USER}/opt/dmft_ed/gnu/$(LIBEDVER)/etc/:$PKG_CONFIG_PATH
	source /home/$(USER)/opt/dmft_ed/gnu/$(LIBEDVER)/etc/dmft_ed_config.sh



	export PKG_CONFIG_PATH=/home/$(USER)/.pkgconfig.d

	$(FC) $(FFLAGS) $(TSTDIR)/asserting.f90 $(TSTDIR)/test_sf_eigh.f90 -o $(TSTBIN)/test_eigh.x $(GLOB_INC) $(GLOB_LIB)
	$(FC) $(FFLAGS) $(TSTDIR)/asserting.f90 $(TSTDIR)/test_sf_trapz.f90 -o $(TSTBIN)/test_trapz.x $(GLOB_INC) $(GLOB_LIB)
	$(FC) $(FFLAGS) $(TSTDIR)/asserting.f90 $(TSTDIR)/test_sf_parsing.f90 -o $(TSTBIN)/test_parsing.x $(GLOB_INC) $(GLOB_LIB)

$(TSTBIN): $(TSTDIR)
	mkdir $(TSTBIN)

$(TSTDIR):

test:
	./RunTests.sh

clean:
	rm -rf $(TSTBIN)
	rm -rf $(TSTDIR)/*.mod
