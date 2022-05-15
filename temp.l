%{

#include<string.h>
#define ssize 200
static int top;
static float stackfloat [ssize];

static void stack_push(float x){
 if (++top<ssize)
    stackfloat [top]=x;
else 
{
printf("Stack overflow\n");
exit(1);}
}
static float stack_pop (void){
if(top>=0)
 return stackfloat [top--];
else {
printf("Stack underflow\n"); exit(1);}
}
int int_v;
%}

nums	[0-9]
I1	{nums}+
R	({nums}+[.]{nums}*)|({nums}*[.]{nums}+)
expression1	({I1}|{R})[eE]{I1}
expression2	({I1}|{R})[eE][+-]{I1}
expression3	[+-]({I1}|{R})[eE][+-]{I1}
I2	[+-]({I1}|{R})
%%

({I1}|{I2}|{R}|{expression1}|{expression2}|{expression3})			{stack_push (atof(yytext));}

"+"					{float x=stack_pop();float y=stack_pop();stack_push (x + y);}
"-"					{float sub1=stack_pop();float sub2=stack_pop(); stack_push (sub2 - sub1);}
"/"					{float sub1=stack_pop();float sub2=stack_pop(); stack_push (sub2 / sub1);}
"*"					{float x=stack_pop();float y=stack_pop();stack_push (x * y);}
\n	               			 {float answer = stack_pop();
						if((answer-(int)answer)==0){printf("%d\n",(int)answer);} else {printf("%f\n",answer);} 
					}

[^-0-9+*/.;eE \t\n]+			{printf("Invalid character\n"); exit(1);}                  
%%


int main(void){
top=-1;
yylex();
return 0;}
int yywrap(void)
{
return 1;
}