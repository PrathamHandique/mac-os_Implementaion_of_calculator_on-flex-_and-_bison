%{
#include "calc.tab.h"
%}

%%

[0-9]+  { yylval = atoi(yytext); return NUMBER; }
"-"     { return MINUS; }
"+"     { return PLUS; }
"*"     { return MULTIPLY; }
"/"     { return DIVIDE; }
"("     { return LPAREN; }
")"     { return RPAREN; }
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Unknown character: %s\n", yytext); }

%%