ifeq ($(OS),Windows_NT)
	RM:=del
	CP:=copy
	PATHSEP2:=\\
	PATHSEP:=$(strip $(PATHSEP2))
	RMDIRS:=rmdir /s /q
	MKDIR_P:=mkdir
	TEXMFHOME:=C:/Users/senge/AppData/Local/MiKTeX/2.9
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

.PHONY: install
install: sde-assignment sde-exam sde-lecture sde-quiz sde-syllabus
ifeq ($(OS),Windows_NT)
	@echo Be sure to refresh the filename database in the MiKTeX Console
endif

.PHONY: sde-assignment
sde-assignment: $(LATEX_DIR)/sde-assignment/sde-assignment.cls

$(LATEX_DIR)/sde-assignment/%: % | $(LATEX_DIR)/sde-assignment
	$(CP) $< $@

$(LATEX_DIR)/sde-assignment:
	$(MKDIR_P) $@

.PHONY: sde-exam
sde-exam: $(LATEX_DIR)/sde-exam/sde-exam.cls

$(LATEX_DIR)/sde-exam/%: % | $(LATEX_DIR)/sde-exam
	$(CP) $< $@

$(LATEX_DIR)/sde-exam:
	$(MKDIR_P) $@

.PHONY: sde-lecture
sde-lecture: $(LATEX_DIR)/sde-lecture/sde-lecture.cls $(LATEX_DIR)/sde-lecture/beamerthemedepaul.sty $(LATEX_DIR)/sde-lecture/depaul-title.png

$(LATEX_DIR)/sde-lecture/%: % | $(LATEX_DIR)/sde-lecture
	$(CP) $< $@

$(LATEX_DIR)/sde-lecture:
	$(MKDIR_P) $@

.PHONY: sde-quiz
sde-quiz: $(LATEX_DIR)/sde-quiz/sde-quiz.cls

$(LATEX_DIR)/sde-quiz/%: % | $(LATEX_DIR)/sde-quiz
	$(CP) $< $@

$(LATEX_DIR)/sde-quiz:
	$(MKDIR_P) $@

.PHONY: sde-syllabus
sde-syllabus: $(LATEX_DIR)/sde-syllabus/sde-syllabus.cls

$(LATEX_DIR)/sde-syllabus/%: % | $(LATEX_DIR)/sde-syllabus
	$(CP) $< $@

$(LATEX_DIR)/sde-syllabus:
	$(MKDIR_P) $@
