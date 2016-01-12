%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
[1-9][0-9]*  {sscanf(yytext, "%d", &yylval);return INTEGER;}
[0-9]*\.[0-9]+  {sscanf(yytext, "%f", &yylval);return FLOAT;}
"+"       return PLUS;
"-"       return MINUS;
"*"       return TIMES;
"/"       return DIVIDE;
"("       return LP;
")"       return RP;
%%
