# Creates three binaries by compiling three different source files:
# normal: E-vs-beta-Normal.cc
# replica: Em-vs-beta-Replica.cc
# mutualinfo: Mutual-info-vs-beta.cc

# Example:
# make normal will compile E-vs-beta-Normal.cc and generate the
# executable "normal", which can then be run as ./normal and so on.

# Special commands:
# "make clean" will remove all generated binaries and .o object
# files;
# "make all" will compile all three source files and generate all
# three binaries in one step.

all: normal replica mutualinfo

normal: E-vs-beta-Normal.cc
	g++ -Wall -O3 E-vs-beta-Normal.cc -o normal
	
replica: Em-vs-beta-Replica.cc
	g++ -Wall -O3 Em-vs-beta-Replica.cc -o replica

mutualinfo: Mutual-info-vs-beta.cc
	g++ -Wall -O3 \
	`pkg-config --cflags --libs gsl tabdatrw-0.3 interp2dpp` \
	Mutual-info-vs-beta.cc -o mutualinfo
	
.PHONY: clean

clean:
	rm -f normal replica mutualinfo *.o 
