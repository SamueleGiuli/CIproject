FC:=mpif90
FFLAGS:= -O2

TSTDIR:=unittest
TSTBIN:=unittest/bin

all: $(TSTBIN)


	echo "${GLOB_INC} $(GLOB_LIB)"
#	source ~/.bashrc

#	echo "step1 PKPATH= ${PKG_CONFIG_PATH}"

#	SCIFORVER=$( ls ~/opt/scifor/gnu)
#	export PKG_CONFIG_PATH=~/opt/scifor/gnu/$(SCIFORVER)/etc/:$(PKG_CONFIG_PATH)
#	source ~/opt/scifor/gnu/$(SCIFORVER)/bin/scifor_config_user.sh

#	echo "step2 PKPATH= ${PKG_CONFIG_PATH}"

#	DMFTVER=$( ls ~/opt/dmft_tools/gnu )
#	export PKG_CONFIG_PATH=~/opt/dmft_tools/gnu/$(DMFTVER)/etc/:$(PKG_CONFIG_PATH)
#	source ~/opt/dmft_tools/gnu/$(DMFTVER)/bin/dmft_tools_config_user.sh

#	echo "step3 PKPATH= ${PKG_CONFIG_PATH}"

#	LIBEDVER=$( ls ~/opt/dmft_ed )
#	export PKG_CONFIG_PATH=~/opt/dmft_ed/gnu/$(LIBEDVER)/etc/:$(PKG_CONFIG_PATH)
#	source ~/opt/dmft_ed/gnu/$(LIBEDVER)/etc/dmft_ed_config.sh

#	echo "step4 PKPATH= ${PKG_CONFIG_PATH}"

#export PKG_CONFIG_PATH=~/.pkgconfig.d:$(PKG_CONFIG_PATH)

#	echo "step5 PKPATH= ${PKG_CONFIG_PATH}"


#	echo "step6 PKPATH= ${PKG_CONFIG_PATH}"
	GLOB_LIB=$(shell pkg-config --libs   dmft_ed dmft_tools scifor)

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

testo:
	echo "PKG: ${PKG_CONFIG_PATH}"
