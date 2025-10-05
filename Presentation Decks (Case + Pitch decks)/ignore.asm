nasm -f elf32 ignore.asm       # Assemble to 32-bit ELF object
ld -m elf_i386 -o ignore ignore.o  # Link to produce executable
./ignore                       # Run the program
