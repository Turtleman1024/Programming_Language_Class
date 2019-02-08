CC=ocamlopt
CFLAGS=-o

.PHONY: all
all: hash

hash: hash.o
		@./start

hash.o: hash_table_example.ml
		@$(CC) $(CFLAGS) start hash_table_example.ml

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