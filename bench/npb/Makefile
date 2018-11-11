SRCPATH=NPB3.3.1
SERIALPATH=$(SRCPATH)/NPB3.3-SER

serial: $(SRCPATH)
	make -C $(SERIALPATH) suite

test: serial
	./verify-cg.sh $(SERIALPATH)/bin/cg.W.x
	./verify-ep.sh $(SERIALPATH)/bin/ep.W.x
	./verify-cg.sh $(SERIALPATH)/bin/cg.A.x
	./verify-ep.sh $(SERIALPATH)/bin/ep.A.x

NPB3.3.1:
	wget https://www.nas.nasa.gov/assets/npb/NPB3.3.1.tar.gz
	tar -xf NPB3.3.1.tar.gz
	rm -f NPB3.3.1.tar.gz
	cp $(SERIALPATH)/config/make.def.template $(SERIALPATH)/config/make.def
	sed -i -e 's/f77/gfortran/' $(SERIALPATH)/config/make.def
	echo "MACHINE=" >>$(SERIALPATH)/config/make.def
	cp $(SERIALPATH)/config/suite.def.template $(SERIALPATH)/config/suite.def
	sed -i -e '/S$$/d' $(SERIALPATH)/config/suite.def
	echo -e "ep W\nep A" >>$(SERIALPATH)/config/suite.def
	echo -e "cg W\ncg A" >>$(SERIALPATH)/config/suite.def

clean:
	rm -rf $(SRCPATH)

