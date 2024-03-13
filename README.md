# mac-os_Implementaion_of_calculator_on-flex-_and-_bison
This repo aims t solve the problem of implementation of a calcu;ator file that performs basic calculator operations  in mac os  
check if flex and bison are already available in the system with 

flex --version 

bison --version

if not installed

install with 

homebrew install flex

homebrew install bison

save the calc.l and calc.y files in desktop


Terminal exacution


cd desktop

flex calc.l

bison -d calc.y

gcc calc.tab.c lex.yy.c -o calc -lfl

./calc
