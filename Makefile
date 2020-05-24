ifeq ($(OS),Windows_NT)
	RM:=del
	CP:=copy
	PATHSEP2:=\\
	PATHSEP:=$(strip $(PATHSEP2))
	RMDIRS:=rmdir /s /q
	MKDIR_P:=mkdir
	TEXMFHOME:=C:\Users\senge\AppData\Local\MiKTeX\2.9
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
TARGETS:=$(LATEX_DIR)/protobuf/lang.sty\
         $(LATEX_DIR)/protobuf/style.sty\
         $(LATEX_DIR)/sde-assignment/sde-assignment.cls\
         $(LATEX_DIR)/sde-exam/sde-exam.cls\
         $(LATEX_DIR)/sde-lecture/sde-lecture.cls\
         $(LATEX_DIR)/sde-lecture/beamerthemedepaul.sty\
         $(LATEX_DIR)/sde-lecture/depaul-title.png\
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

$(LATEX_DIR)/protobuf/%: protobuf/% | $(LATEX_DIR)/protobuf
	$(CP) $(subst /,$(PATHSEP),$<) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/protobuf:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-assignment/%: % | $(LATEX_DIR)/sde-assignment
	$(CP) $< $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-assignment:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-exam/%: % | $(LATEX_DIR)/sde-exam
	$(CP) $< $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-exam:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-lecture/%: % | $(LATEX_DIR)/sde-lecture
	$(CP) $< $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-lecture:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-quiz/%: % | $(LATEX_DIR)/sde-quiz
	$(CP) $< $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-quiz:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-syllabus/%: % | $(LATEX_DIR)/sde-syllabus
	$(CP) $< $(subst /,$(PATHSEP),$@)

$(LATEX_DIR)/sde-syllabus:
	$(MKDIR_P) $(subst /,$(PATHSEP),$@)