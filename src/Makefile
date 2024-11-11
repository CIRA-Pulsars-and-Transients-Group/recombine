CXX = g++
CXXFLAGS = -O3 -march=znver3 \
		   -ftree-loop-distribution \
		   -funroll-all-loops \
		   -fdata-sections \
		   -fstack-protector \
		   -I${PAWSEY_CFITSIO_HOME}/include
LDFLAGS = -L${PAWSEY_CFITSIO_HOME}/lib -lcfitsio -lcurl		   


src_files = main.cpp recombine.cpp
obj_files = main.o recombine.o
deps = recombine.h

%.o: %.cpp $(deps)
	$(CXX) -c -o $@ $(CXXFLAGS) $<

recombine: $(obj_files)
	$(CXX) $^ -o $@ $(LDFLAGS)

all: recombine

clean:
	rm -f main.o recombine.o
