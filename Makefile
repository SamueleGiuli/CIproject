#Simple makefile to complete installation of the full Package offered for DMFT solver

inst_scifor: scifor
	cd scifor; mkdir build; cd build; \
	ls -r; cmake .. ; make; make install

inst_DMFTtools: DMFTtools
	cd DMFTtools; mkdir build; cd build; \
	ls -r; cmake .. ; make; make install

inst_LIB_DMFT_ED: LIB_DMFT_ED
	cd LIB_DMFT_ED; mkdir build; cd build; \
	ls -r; cmake .. ; make; make install; make post-install

