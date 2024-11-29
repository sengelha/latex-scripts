ifeq ($(OS),Windows_NT)
    / := $(strip \)
    TEXMFHOME := $(subst $(/),/,$(USERPROFILE))/texmf
    TARGETDIR := $(TEXMFHOME)/tex/latex
    MKDIRP := mkdir
    CP := copy
    POSTINSTALL := initexmf --user-roots=$(TEXMFHOME) --update-fndb=$(TEXMFHOME) --update-fndb
else
    / := /
    TEXMFHOME := $(shell kpsewhich -var-value TEXMFHOME)
    TARGETDIR := $(TEXMFHOME)$(/)tex$(/)latex
    MKDIRP := mkdir -p
    CP := cp
    POSTINSTALL :=
endif

SRCS := beamertheme-depaul/beamercolorthemedepaul.sty
SRCS += beamertheme-depaul/beamerthemedepaul.sty
SRCS += beamertheme-depaul/depaul-title.png
SRCS += sde-assignment/sde-assignment.cls
SRCS += sde-exam/sde-exam.cls
SRCS += sde-lecture/sde-lecture.cls
SRCS += sde-listings/sde-listings.sty
SRCS += sde-quiz/sde-quiz.cls
SRCS += sde-syllabus/sde-syllabus.cls
TARGETS := $(addprefix $(TARGETDIR)/,$(SRCS))

.PHONY: all
all: $(TARGETS)
	$(POSTINSTALL)

$(TARGETDIR)/beamertheme-depaul:
	$(MKDIRP) $(subst /,$(/),$@)
$(TARGETDIR)/beamertheme-depaul/%: beamertheme-depaul/% | $(TARGETDIR)/beamertheme-depaul
	$(CP) $(subst /,$(/),$<) $(subst /,$(/),$@)
$(TARGETDIR)/sde-assignment:
	$(MKDIRP) $(subst /,$(/),$@)
$(TARGETDIR)/sde-assignment/%: sde-assignment/% | $(TARGETDIR)/sde-assignment
	$(CP) $(subst /,$(/),$<) $(subst /,$(/),$@)
$(TARGETDIR)/sde-exam:
	$(MKDIRP) $(subst /,$(/),$@)
$(TARGETDIR)/sde-exam/%: sde-exam/% | $(TARGETDIR)/sde-exam
	$(CP) $(subst /,$(/),$<) $(subst /,$(/),$@)
$(TARGETDIR)/sde-lecture:
	$(MKDIRP) $(subst /,$(/),$@)
$(TARGETDIR)/sde-lecture/%: sde-lecture/% | $(TARGETDIR)/sde-lecture
	$(CP) $(subst /,$(/),$<) $(subst /,$(/),$@)
$(TARGETDIR)/sde-listings:
	$(MKDIRP) $(subst /,$(/),$@)
$(TARGETDIR)/sde-listings/%: sde-listings/% | $(TARGETDIR)/sde-listings
	$(CP) $(subst /,$(/),$<) $(subst /,$(/),$@)
$(TARGETDIR)/sde-quiz:
	$(MKDIRP) $(subst /,$(/),$@)
$(TARGETDIR)/sde-quiz/%: sde-quiz/% | $(TARGETDIR)/sde-quiz
	$(CP) $(subst /,$(/),$<) $(subst /,$(/),$@)
$(TARGETDIR)/sde-syllabus:
	$(MKDIRP) $(subst /,$(/),$@)
$(TARGETDIR)/sde-syllabus/%: sde-syllabus/% | $(TARGETDIR)/sde-syllabus
	$(CP) $(subst /,$(/),$<) $(subst /,$(/),$@)
