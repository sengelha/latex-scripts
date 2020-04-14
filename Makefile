ifeq ($(OS),Windows_NT)
	RM=del
	CP=copy
	PATHSEP2=\\
	PATHSEP=$(strip $(PATHSEP2))
	RMDIRS=rmdir /s /q
	MKDIR_P=mkdir
else
	RM=rm -f
	CP=cp
	PATHSEP2=/
	PATHSEP=$(strip $(PATHSEP2))
	RMDIRS=rm -rf
	MKDIR_P=mkdir
endif

DESTDIR=C:\Users\senge\AppData\Local\MiKTeX\2.9\tex\latex

.PHONY: install
install: sde-assignment sde-exam sde-lecture sde-quiz sde-syllabus
	@echo Be sure to refresh the filename database in the MiKTeX Console

.PHONY: sde-assignment
sde-assignment: $(DESTDIR)\sde-assignment\sde-assignment.cls

$(DESTDIR)\sde-assignment\sde-assignment.cls: sde-assignment.cls | $(DESTDIR)\sde-assignment
	$(CP) sde-assignment.cls $(DESTDIR)\sde-assignment\sde-assignment.cls

$(DESTDIR)\sde-assignment:
	$(MKDIR_P) $(DESTDIR)\sde-assignment

.PHONY: sde-exam
sde-exam: $(DESTDIR)\sde-exam\sde-exam.cls

$(DESTDIR)\sde-exam\sde-exam.cls: sde-exam.cls | $(DESTDIR)\sde-exam
	$(CP) sde-exam.cls $(DESTDIR)\sde-exam\sde-exam.cls

$(DESTDIR)\sde-exam:
	$(MKDIR_P) $(DESTDIR)\sde-exam

.PHONY: sde-lecture
sde-lecture: $(DESTDIR)\sde-lecture\sde-lecture.cls $(DESTDIR)\sde-lecture\beamerthemedepaul.sty $(DESTDIR)\sde-lecture\depaul-title.png

$(DESTDIR)\sde-lecture\sde-lecture.cls: sde-lecture.cls | $(DESTDIR)\sde-lecture
	$(CP) sde-lecture.cls $(DESTDIR)\sde-lecture\sde-lecture.cls

$(DESTDIR)\sde-lecture\beamerthemedepaul.sty: beamerthemedepaul.sty | $(DESTDIR)\sde-lecture
	$(CP) beamerthemedepaul.sty $(DESTDIR)\sde-lecture\beamerthemedepaul.sty

$(DESTDIR)\sde-lecture\depaul-title.png: depaul-title.png | $(DESTDIR)\sde-lecture
	$(CP) depaul-title.png $(DESTDIR)\sde-lecture\depaul-title.png

$(DESTDIR)\sde-lecture:
	$(MKDIR_P) $(DESTDIR)\sde-lecture

.PHONY: sde-quiz
sde-quiz: $(DESTDIR)\sde-quiz\sde-quiz.cls

$(DESTDIR)\sde-quiz\sde-quiz.cls: sde-quiz.cls | $(DESTDIR)\sde-quiz
	$(CP) sde-quiz.cls $(DESTDIR)\sde-quiz\sde-quiz.cls

$(DESTDIR)\sde-quiz:
	$(MKDIR_P) $(DESTDIR)\sde-quiz

.PHONY: sde-syllabus
sde-syllabus: $(DESTDIR)\sde-syllabus\sde-syllabus.cls

$(DESTDIR)\sde-syllabus\sde-syllabus.cls: sde-syllabus.cls | $(DESTDIR)\sde-syllabus
	$(CP) sde-syllabus.cls $(DESTDIR)\sde-syllabus\sde-syllabus.cls

$(DESTDIR)\sde-syllabus:
	$(MKDIR_P) $(DESTDIR)\sde-syllabus
