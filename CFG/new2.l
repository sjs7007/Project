%{
	enum yytokentype {
		BLOCK=258,
		GOTO=259,
		EOL=260
	};
	int yylval;
%}



%%
"<bb "[0-9]+">" { return BLOCK; }
"goto" { return GOTO; }
\n { return EOL; }
[ \t] {}
. { }
%%

main(int argc, char **argv)
{
	int tok;
	while(tok = yylex())
	{
		printf("%d",tok);
		if(tok==BLOCK) printf("-> B\n");
		else printf("\n");
	}
}
