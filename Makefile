# CC=g++
# SHELL:=/bin/bash

# main: main.cpp
# 	module load gcc-11.2
# 	$(CC) -g -std=gnu++11 -lstdc++ main.cpp -o main
	
# clean:
# 	rm -f main *~


CC:=g++

LDFLAGS:=$(shell pkg-config --cflags --libs /opt/homebrew/Cellar/libtins/*/lib/pkgconfig/libtins.pc)


CFLAGS:=--std=c++14 -ggdb
SRC_FILES:=$(wildcard ./*.cpp)
OBJ_FILES:=$(patsubst %.cpp,obj/%.o,$(SRC_FILES))

main: $(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $@ $^

obj/%.o: %.cpp
	$(CC) $(LDFLAGS) $(CFLAGS) -c -o $@ $<

clean:
	rm main
	rm obj/*.o
