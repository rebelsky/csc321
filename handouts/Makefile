include ../resources/section.mk

MKSCHEDULE=../tools/mkschedule

schedule.html: overviews/*.xml
overviews/%.xml: ../outlines/overviews/%.md
	../tools/overview2xml $^ > $@

schedule.sect: $(MKSCHEDULE)
	$(MKSCHEDULE) 321-fall > $@


