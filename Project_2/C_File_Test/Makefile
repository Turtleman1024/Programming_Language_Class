
.PHONY: all
all: test

#Rule that tests the program
test: rdp
	@echo "                        "
	@echo " RDP VALID TEST BEGIN"
	@echo "------------------------"	
	@./main.native test1.dat
	@echo "                        "
	@echo "------------------------"
	@echo "  RDP VALID TEST END  "

	@echo "                        "
	@echo "                        "
	@echo "  RDP VALID TEST BEGIN"
	@echo "------------------------"
	@./main.native test3.dat
	@echo "                        "
	@echo "------------------------"
	@echo "   RDP VALID TEST END  "

# Rule to test a valid string only
valid2 : rdp
	@echo "                        "
	@echo " RDP VALID TEST BEGIN"
	@echo "------------------------"	
	@./main.native test1.dat
	@echo "                        "
	@echo "------------------------"
	@echo "  RDP VALID TEST END  "

# Rule to test a invalid string only
valid: rdp
	@echo "                        "
	@echo "                        "
	@echo "  RDP VALID TEST BEGIN"
	@echo "------------------------"
	@./main.native test3.dat
	@echo "                        "
	@echo "------------------------"
	@echo "   RDP VALID TEST END  "

# Rule to compile the code using ocamlbuild native compiler
rdp:
	@ocamlbuild -r main.native

#Dist rule that creates a tar file of all source and build files such that it can
#be transfered to another computer and built.
dist: 
	mkdir project1
	cp -r *.ml project1/
	cp -r README test*.dat Makefile project1/
	cp -r Get_File_Buffer_Test/ project1/
	cp -r RDP_Test project1/
	cp -r Get_Token_Test/ project1/
	tar cvzf Murry_Kenneth_project1.tgz project1
	rm -rf project1

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

