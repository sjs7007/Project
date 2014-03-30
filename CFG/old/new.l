%%
"<bb "[0-9]+">" { printf("BLOCK\n"); }
"goto" { printf("GOTO\n"); }
\n { printf("NEWLINE\n"); }
[ \t] {}
. { }
%%
