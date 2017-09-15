CC = g++
CPPFLAGS = -std=c++11 -I.
TARGET = progress_bar
OBJ = block_wrappers.o gzip_stream.o compressed_stream.o lz4.o


all : libprotobuf-zerocopy-compression.a

libprotobuf-zerocopy-compression.a : $(OBJ)
	@echo "<***Linking***> $@"
	ar rs $@ $(OBJ)

block_wrappers.o : block_wrappers.cc
	@echo "<**Compiling**> $@"
	@$(CC) $(CPPFLAGS) -c $^

gzip_stream.o : gzip_stream.cc
	@echo "<**Compiling**> $@"
	@$(CC) $(CPPFLAGS) -c $^

compressed_stream.o : compressed_stream.cc
	@echo "<**Compiling**> $@"
	@$(CC) $(CPPFLAGS) -c $^

lz4.o : lz4.cc
	@echo "<**Compiling**> $@"
	@$(CC) $(CPPFLAGS) -c $^

clean :
	@rm -rf libprotobuf-zerocopy-compression.a $(OBJ)
