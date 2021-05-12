FC:=mpif90
FFLAGS:= -O2

TSTDIR:=unittest
TSTBIN:=unittest/bin

all: $(TSTBIN)


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
