%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE
%token LPAREN RPAREN
%token EOL

%left PLUS MINUS
%left MULTIPLY DIVIDE

%%
calculation: /* empty */
    | calculation expression EOL { printf("Result: %d\n", $2); }
    ;

expression: NUMBER
    | expression PLUS expression       { $$ = $1 + $3; }
    | expression MINUS expression      { $$ = $1 - $3; }
    | expression MULTIPLY expression   { $$ = $1 * $3; }
    | expression DIVIDE expression     { $$ = $1 / $3; }
    | LPAREN expression RPAREN         { $$ = $2; }
    ;

%%
int main(void) {
    printf("Enter your calculation:\n");
    yyparse();
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}