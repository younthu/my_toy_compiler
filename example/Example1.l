%{
#include <stdio.h>
%}
%%
stop    printf("Stop command received\n");
start   printf("Start command received\n");
%%

#lex example1.lt
# cc lex.yy.c -o example -ll
