TEXMFHOME := $(shell kpsewhich -var-value TEXMFHOME)

.PHONY: install
install:
	mkdir -p $(TEXMFHOME)/tex/latex
	ln -sf $(PWD)/beamertheme-depaul/ $(TEXMFHOME)/tex/latex/beamertheme-depaul
	ln -sf $(PWD)/sde-assignment/ $(TEXMFHOME)/tex/latex/sde-assignment
	ln -sf $(PWD)/sde-lecture/ $(TEXMFHOME)/tex/latex/sde-lecture
	ln -sf $(PWD)/sde-listings/ $(TEXMFHOME)/tex/latex/sde-listings
	ln -sf $(PWD)/sde-syllabus/ $(TEXMFHOME)/tex/latex/sde-syllabus
