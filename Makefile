ifeq ($(OS),Windows_NT)
	RM:=del
	CP:=copy
	PATHSEP2:=\\
	PATHSEP:=$(strip $(PATHSEP2))
	RMDIRS:=rmdir /s /q
	MKDIR_P:=mkdir
	TEXMFHOME:=$(HOMEDRIVE)$(HOMEPATH)\AppData\Local\MiKTeX\2.9
else
	RM:=rm -f
	CP:=cp
	PATHSEP2:=/
	PATHSEP:=$(strip $(PATHSEP2))
	RMDIRS:=rm -rf
	MKDIR_P:=mkdir -p
	TEXMFHOME:=$(shell kpsewhich -var-value TEXMFHOME)
endif

LATEX_DIR:=$(TEXMFHOME)/tex/latex
TARGETS:=\
         $(LATEX_DIR)/sde-listings.sty\
	 $(LATEX_DIR)/sde-assignment/sde-assignment.cls\
         $(LATEX_DIR)/sde-exam/sde-exam.cls\
         $(LATEX_DIR)/sde-lecture/sde-lecture.cls\
         $(LATEX_DIR)/sde-lecture/beamerthemedepaul.sty\
         $(LATEX_DIR)/sde-lecture/depaul-title.png\
         $(LATEX_DIR)/sde-protobuf/lang.sty\
         $(LATEX_DIR)/sde-protobuf/style.sty\
         $(LATEX_DIR)/sde-quiz/sde-quiz.cls\
         $(LATEX_DIR)/sde-syllabus/sde-syllabus.cls

.PHONY: install
install: $(TARGETS)
ifeq ($(OS),Windows_NT)
	initexmf --update-fndb
endif

.PHONY: clean
clean:
	$(RM) $(subst /,$(PATHSEP),$(TARGETS))

$(LATEX_DIR)/sde-listings.sty: sde-listings.sty | $(LATEX_DIR)
	$(CP) $(subst /,$(PATHSEP),$<) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR):
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-assignment/%: sde-assignment/% | $(LATEX_DIR)/sde-assignment
	$(CP) $(subst /,$(PATHSEP),$<) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-assignment:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-exam/%: sde-exam/% | $(LATEX_DIR)/sde-exam
	$(CP) $(subst /,$(PATHSEP),$<) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-exam:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-lecture/%: sde-lecture/% | $(LATEX_DIR)/sde-lecture
	$(CP) $(subst /,$(PATHSEP),$<) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-lecture:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-protobuf/%: sde-protobuf/% | $(LATEX_DIR)/sde-protobuf
	$(CP) $(subst /,$(PATHSEP),$<) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-protobuf:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-quiz/%: sde-quiz/% | $(LATEX_DIR)/sde-quiz
	$(CP) $(subst /,$(PATHSEP),$<) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-quiz:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-syllabus/%: sde-syllabus/% | $(LATEX_DIR)/sde-syllabus
	$(CP) $(subst /,$(PATHSEP),$<) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-syllabus:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)
