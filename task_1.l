/*
This LEX program to check for
valid identifiers from a
text file "text.txt"
*/

%option noyywrap

%{
	#include <bits/stdc++.h>
	#include <vector>
	using namespace std;
	vector<string> keyword;
	vector<string> identifier;
	vector<string> operators;
	vector<string> parenthesis;
	vector<string> comma;
	vector<string> number;
%}

KeyWord "main"|"auto"|"double"|"int"|"struct"|"break"|"else"|"long"|"switch"|"case"|"enum"|"register"|"typedef"|"char"|"extern"|"return"|"union"|"const"|"float"|"short"|"unsigned"|"continue"|"for"|"signed"|"void"|"default"|"goto"|"sizeof"|"volatile"|"do"|"if"|"static"|"while"
Alphabet [a-zA-Z]
Number [-+]?[0-9]
Float [-+]?[0-9]*[.][0-9]+$
Space [\t\n]
Comma [,;]
Operator "+"|"-"|"*"|"/"|"%"|"="|"<"|">"|"!"
Parenthesis "("|")"|"{"|"}"|"["|"]"
Comment "/*"([^*]*|(\*+[^/]))*"*/"

%%
{KeyWord} {keyword.push_back(yytext);}
{Operator} {operators.push_back(yytext);}
{Parenthesis} {parenthesis.push_back(yytext);}
{Comma} {comma.push_back(yytext);}
({Number}*|{Float}*) {number.push_back(yytext);}
(_|{Alphabet})(_|{Alphabet}|{Number}|^{Space})* {identifier.push_back(yytext);}
.|[ \n] ;
{Comment} {}
%%

int main(){
	
	yyin = fopen("text.txt", "r");
	yylex();
	printf("Keywords:- ");
	for(int i=0;i<keyword.size();i++){
		printf("%s, ", keyword[i].c_str());
	}
	printf("\nIdentifiers:- ");
	for(int i=0;i<identifier.size();i++){
		printf("%s, ", identifier[i].c_str());
	}
	printf("\nOperators:- ");
	for(int i=0;i<operators.size();i++){
		printf("%s, ", operators[i].c_str());
	}
	printf("\nParenthesis:- ");
	for(int i=0;i<parenthesis.size();i++){
		printf("%s, ", parenthesis[i].c_str());
	}
	printf("\nComma:- ");
	for(int i=0;i<comma.size();i++){
		printf("%s, ", comma[i].c_str());
	}
	printf("\nNumbers:- ");
	for(int i=0;i<number.size();i++){
		printf("%s, ", number[i].c_str());
	}
	printf("\n");
	return 0;
}
