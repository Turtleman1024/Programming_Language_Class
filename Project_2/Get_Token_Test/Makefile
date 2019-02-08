
.PHONY: all
all: test

#Rule that tests the program
test: start
	@./main.native test1.dat

start:
	@ocamlbuild main.native

.PHONY: clean
clean:
	-@rm -f *.o
	-@rm -f start
	-@rm -f *.cm*
	-@rm -f *.native
	-@rm -rf _build
	-@rm -f *.native
	
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