SRCDIR=src

$(SRCDIR)/lulesh2.0: $(SRCDIR)
	make -C $(SRCDIR)

test: $(SRCDIR)/lulesh2.0
	./verify-lulesh.sh $<

$(SRCDIR):
	git clone https://github.com/LLNL/LULESH.git $(SRCDIR)
	cd $(SRCDIR) && git checkout tags/2.0.3
	sed -i -e 's/^CXX = .*/CXX = $$(SERCXX)/' $(SRCDIR)/Makefile
	sed -i -e 's/CXXFLAGS = .*/CXXFLAGS = -g -O3 -I. -Wall/' $(SRCDIR)/Makefile
	sed -i -e 's/LDFLAGS = .*/LDFLAGS = -g -O3 /' $(SRCDIR)/Makefile

clean:
	rm -rf $(SRCDIR)

