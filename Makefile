
MYSQLLIBDIR = /usr/lib/mysql
MYSQLINCDIR = /usr/include/mysql

PIC = -fPIC
INCLUDES = -I/usr/pkg/include/tcl8.0 -I$(MYSQLINCDIR)
CFLAGS += -Wall $(PIC) $(INCLUDES)

LDFLAGS = -Bshareable -lz -x $(MYSQLLIBDIR)/libmysqlclient.a

all:	fbsql.so 

fbsql.so: fbsql.o
	$(LD) -o $@  $<  $(LDFLAGS)

clean:
	-rm -f core *.o fbsql.so

clobber: clean
	-rm -f fbsql.so

