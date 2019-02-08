OP=ocamlopt
OPFLAGS=-o

.PHONY: all
all: test

test: Get_file_buffer.o
	@./start test1.dat

Get_file_buffer.o: get_file_buffer.ml
	@$(OP) $(OPFLAGS) start get_file_buffer.ml

.PHONY: clean
clean:
	-@rm -f *.o
	-@rm -f start
	-@rm -f *.cm*
	
	@echo "                      "
	@echo "Fred's Cleaning Services " 
	@echo "                      "
	@echo "        ____   I hear you need some files"
	@echo "       _|__|_  to swim with the fishes"
	@echo "        @..@  / "
	@echo "       (----)  "
	@echo "      ( >__< ) "
	@echo "      ^^ ~~ ^^ "
	@echo "                      "