FCOMP = gfortran
FCFLAGS = -g -O2
LDFLAGS = 
PROGRAM =  misdat

OBJDIR  =  build
SRCSDIR = ./source

SRCS = $(wildcard $(SRCSDIR)/*.f)
OBJECTS = $(patsubst $(SRCSDIR)/%.f, $(OBJDIR)/%.o, $(SRCS))

all: $(OBJDIR) $(PROGRAM)

$(OBJDIR):
	mkdir $(OBJDIR)

$(PROGRAM): $(OBJECTS)
	$(FCOMP) $(FCFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCSDIR)/%.f
	$(FCOMP) $(FCFLAGS) -c $< -o $@

.PHONY: clean veryclean

clean:
	rm -f *.o *.mod *.MOD 
	rm -rf $(OBJDIR)

veryclean: clean
	rm -f *~ $(PROGRAM) 
