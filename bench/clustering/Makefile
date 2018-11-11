OBJECTS = main.o state.o
CXXFLAGS = -O2 -Wall -Ieigen-3.3.5 -Igsl-2.5
LDFLAGS = -Lgsl-2.5/.libs -lgsl -Lgsl-2.5/cblas/.libs -lgslcblas

infer : $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o infer $(OBJECTS) $(LDFLAGS)

eigen-3.3.5/Eigen/Dense :
	wget http://bitbucket.org/eigen/eigen/get/3.3.5.tar.gz
	tar xf 3.3.5.tar.gz
	rm 3.3.5.tar.gz
	mv eigen-eigen-b3f3d4950030 eigen-3.3.5

gsl-2.5/gsl/gsl_randist.h :
	wget http://ftpmirror.gnu.org/gsl/gsl-2.5.tar.gz
	tar -xf gsl-2.5.tar.gz
	rm gsl-2.5.tar.gz
	cd gsl-2.5 && ./configure && make -j 8

main.o : state.hpp eigen-3.3.5/Eigen/Dense gsl-2.5/gsl/gsl_randist.h

clean :
	rm -f infer $(OBJECTS)
