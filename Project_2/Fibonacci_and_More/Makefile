CC=ocamlopt
CFLAGS=-o

.PHONY: all
all: hello

hello: Hello_World.o
		@./start

Hello_World.o: HelloWorld.ml
		@$(CC) $(CFLAGS) start HelloWorld.ml	

pattern: Pattern_Matching.o
	@./start		

Pattern_Matching.o: Pattern_Matching.ml
		@$(CC) $(CFLAGS) start Pattern_Matching.ml

currying: Currying.o
	@./start

Currying.o: Currying.ml
	@$(CC) $(CFLAGS) start Currying.ml

factorial: Factorial.o
	@./start

Factorial.o: Factorial.ml
	@$(CC) $(CFLAGS) start Factorial.ml

fibonacci: Fibonacci.o
	@./start

Fibonacci.o: Fibonacci.ml
	@$(CC) $(CFLAGS) start Fibonacci.ml

read_file: Reading_from_file.o
	@./start tm.def

Reading_from_file.o: Reading_from_file.ml
	@$(CC) $(CFLAGS) start Reading_from_file.ml



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