# ------------------------------------------------------ #
#  innbbsd/Makefile     ( NTHU CS MapleBBS Ver 3.10 )    #
# ------------------------------------------------------ #
#  target : Makefile for ��H�{�� innbbsd                #
#  create : 95/03/29                                     #
#  update : 01/08/26                                     #
#  author : skhuang                                      #
# ------------------------------------------------------ #

MAKE	+= -f Makefile.gnu

ARCHI	:= $(shell uname -m)

# ------------------------------------------------------ #
# �U�C�� make rules ���ݭק�				 #
# ------------------------------------------------------ #

INNOBJS	= channel.o bbslib.o convcode.o inntobbs.o rec_article.o nocem.o history.o

LNKOBJS	= bbslink.o bbslib.o convcode.o inntobbs.o rec_article.o nocem.o history.o

EXE	= innbbsd bbslink

CC	= clang

CFLAGS	= -g -O2 -pipe -I../include -fomit-frame-pointer -Wunused

LDFLAGS	= -L../lib -ldao

ifeq ($(ARCHI),x86_64) 
CFLAGS	+= -m32
LDFLAGS	+= -m32
else
ifeq ($(ARCHI),amd64)
CFLAGS	+= -m32
LDFLAGS	+= -m32
endif
endif

all: 
	@$(MAKE) CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(EXE)

bbslink: $(LNKOBJS)
	$(CC) -o bbslink $(LNKOBJS) $(OPT) $(LDFLAGS)

innbbsd: $(INNOBJS)
	$(CC) -o innbbsd $(INNOBJS) $(OPT) $(LDFLAGS)

install: $(EXE)
	install -m 0700 $? $(HOME)/innd

update:
	-csh -c "kill `tail -1 $(HOME)/run/innbbsd.pid | awk '{print $$1}'`";exit 0

clean:
	rm -f $(EXE) *.o *~
