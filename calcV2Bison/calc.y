%{
#include <stdio.h>
#include <string.h>

#define YYSTYPE int

void yyerror(const char *str)
{
	fprintf(stderr,"error: %s\n",str);
}

int yywrap()
{
	return 1;
}

main()
{
	yyparse();
}

%}

%token PLUS MINUS TIMES DIVIDE LP RP
%union
{
    int number;
    float float;
}
%token <number> INTEGER
%token <float> FLOAT

%%
command : expint {printf("%d\n",$1);} | expfloat {printf("%f\n", $1);}
expint: |expint PLUS termint {$$ = $1 + $3;}
	|expint MINUS termint {$$ = $1 - $3;}
	|termint {$$ = $1;}
	;
termint : termint TIMES factorint {$$ = $1 * $3;}
	|termint DIVIDE factorint {$$ = $1/$3;}
	|factorint {$$ = $1;}
	;
factorint : INTEGER {$$ = $1;}
	| LP expint RP {$$ = $2;}
	;

expfloat: |expfloat PLUS termint {$$ = $1 + $3;}
  	|expfloat PLUS termfloat {$$ = $1 + $3;}
    |expfint PLUS termfloat {$$ = $1 + $3;}
  	|expint MINUS termfloat {$$ = $1 - $3;}
  	|expfloat MINUS termfloat {$$ = $1 - $3;}
  	|expfloat MINUS termint {$$ = $1 - $3;}
  	|termflaot {$$ = $1;}
  	;
termfloat: termint TIMES factorfloat {$$ = $1 * $3;}
      |termfloat TIMES factorfloat {$$ = $1 * $3;}
      |termfloat TIMES factorint {$$ = $1 * $3;}
  	|termint DIVIDE factorfloat {$$ = $1/$3;}
    |termfloat DIVIDE factorint {$$ = $1/$3;}
    |termfloat DIVIDE factorfloat {$$ = $1/$3;}
  	|factorfloat {$$ = $1;}
  	;
factorfloat: FLOAT {$$ = $1;}
  	| LP expfloat RP {$$ = $2;}
  	;
%%
