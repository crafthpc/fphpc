SRCDIR=src

$(SRCDIR)/test_HPCCG: $(SRCDIR)
	make -C $(SRCDIR)

$(SRCDIR):
	git clone https://github.com/Mantevo/HPCCG.git $(SRCDIR)
	cd $(SRCDIR) && git checkout 80dd2f12a4e8aa70c330a5686cdda3fd187c2545
	sed -i -e '/CXX=/d' $(SRCDIR)/Makefile
	sed -i -e 's/LINKER=.*$$/LINKER=$$(CXX)/' $(SRCDIR)/Makefile

clean:
	rm -rf $(SRCDIR)

