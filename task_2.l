%{
#include <bits/stdc++.h>
#include <vector>
using namespace std;

vector<string> oparator;
vector<double> operand;

void calculate();
%}

%option noyywrap

%%


"+"|"-"|"*"|"/"|"^"|"!"  {string str(yytext); oparator.push_back(str);}
([0-9]*"."[0-9]+)|([-][0-9]*"."[0-9]+)|([0-9]+)|("-"[0-9]+) {double temp = atof(yytext); operand.push_back(temp);}
"sin"|"tan"|"cot"|"log"|"ln"|"cos"|"root"|"abs"|"mod" {string str(yytext); oparator.push_back(str);}
\n  {calculate();}

.

%%

void calculate(){
  double ans = 0;
  int i=0,j=0;
  if(oparator[0] == "+"){
      ans =  operand[0] + operand[1];

    }
    else if(oparator[0] == "-"){
       ans =  operand[0] - operand[1];
      
    }
    else if(oparator[0] == "*"){
       ans =  operand[0] *  operand[1];
     

    }
    else if(oparator[0] == "/"){
       ans =  operand[0] / operand[1];
      
     
    }
    else if(oparator[0] == "log"){
      ans = log10(operand[0]);
     
    }
    else if(oparator[0] == "ln"){
      ans = log(operand[0]);

    }
    else if(oparator[0] == "cos"){
      ans = cos(operand[0] *3.1416 / 180);

    }
    else if(oparator[0] == "sin"){
      ans = sin(operand[0]* 3.1416 / 180);
  
    }
    else if(oparator[0] == "tan"){
      ans = tan(operand[0]*3.1416 / 180);
 
    }
    else if(oparator[0] == "cot"){
      ans = 1/tan(operand[0]*3.1416 / 180);
 
    }
    else if(oparator[0] == "mod"){
      ans = (int)operand[0] % (int)operand[1];
 
    }
    else if(oparator[0] == "^"){
      ans = pow(operand[0], operand[1]);
   
    }
    else if(oparator[0] == "root"){
      ans = pow(operand[0], 1.0 / operand[1]);
    
    }
    else if(oparator[0] == "!"){
	double res = 1;
  	for(double i = 1; i <=operand[0] ; i++){
    		res *= i;
  	}
      ans = res;
     
    }
    else if(oparator[0] == "abs"){
      ans = abs(operand[0]);
    
    }
	else{ 
      printf("Enter Expression\n"); 
    }
    
    printf("Result: %lf\n", ans);
    operand.clear();
    oparator.clear(); 
}


int main(){
  printf("Available Commands:\n");
  printf("+(ADD)\n-(SUB)\n*(MUL)\n/(DIV)\n^(POW)\n!(FACT)\nlog\nln\ncos\nsin\ntan\ncot\nroot\nabs\nmod\n");
  printf("Enter Expression\n");
  yylex();
  return 0;
}