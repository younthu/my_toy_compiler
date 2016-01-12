%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
[0-9]+          printf("parsing %s",yytext);yylval=atoi(yytext); return NUMBER;
heat            return TOKHEAT;
on|off          yylval=!strcmp(yytext,"on"); return STATE;
target          return TOKTARGET;
temperature     return TOKTEMPERATURE;
\n              /* ignore end of line */;
[ \t]+          /* ignore whitespace */;
%%
