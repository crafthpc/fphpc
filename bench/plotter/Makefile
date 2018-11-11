all: good.bmp bad.bmp

EasyBMP/EasyBMP.cpp:
	wget 'https://downloads.sourceforge.net/project/easybmp/easybmp/EasyBMP%20Library%20Files%20Version%201.06/EasyBMP_1.06.zip'
	mkdir EasyBMP
	unzip -d EasyBMP EasyBMP_1.06.zip
	rm EasyBMP_1.06.zip

EasyBMP/EasyBMP.o: EasyBMP/EasyBMP.cpp
	$(CXX) -O3 EasyBMP/EasyBMP.cpp -c -o $@

plotter.std: main.cpp EasyBMP/EasyBMP.o
	$(CXX) -O3 -g $^ -DSQRT=sqrt -o $@

plotter.good: main.cpp EasyBMP/EasyBMP.o
	$(CXX) -O3 -g $^ -DSQRT=goodsqrt -o $@

plotter.bad: main.cpp EasyBMP/EasyBMP.o
	$(CXX) -O3 -g $^ -DSQRT=badsqrt -o $@

plotter.bad.s: main.cpp EasyBMP/EasyBMP.o
	$(CXX) -O0 -g -S -o $@ $^ -DSQRT=badsqrt

%.bmp: plotter.%
	./$< 1000 $@

clean:
	rm -f plotter.* *.bmp EasyBMP/EasyBMP.o
