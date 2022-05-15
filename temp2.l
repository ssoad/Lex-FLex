%{
#include <bits/stdc++.h>
using namespace std;
#define PI 3.14159265358979323846
string oprtr;
vector<double> oprnd;
void compute();
double factorial(double n);
int gcd(int a, int b);
%}

%option noyywrap

%%


"+"|"-"|"*"|"/"  {string str(yytext); oprtr = str;}

([0-9]*"."[0-9]+)|([-][0-9]*"."[0-9]+)|([0-9]+)|("-"[0-9]+) {double temp = atof(yytext); oprnd.push_back(temp);}

"log"|"ln"|"cos"|"sin"|"tan"|"pow"|"root"|"fact"|"abs"|"gcd" {string str(yytext); oprtr = str;}

\n  {compute();}

.

%%

int main(){
  extern FILE *yyin, *yyout;   
  yyin = fopen("samplecalinput.txt", "r"); 
  yyout = fopen("outputforcalculator.txt", "w"); 
  yylex();
  return 0;
}

void compute(){
    if(oprtr == "+"){
      fprintf(yyout, "%lf + %lf = %.4lf\n", oprnd[0], oprnd[1], oprnd[0] + oprnd[1]);
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "-"){
      fprintf(yyout, "%lf - %lf = %.4lf\n", oprnd[0], oprnd[1], oprnd[0] - oprnd[1]);
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "*"){
      fprintf(yyout, "%lf * %lf = %.4lf\n", oprnd[0], oprnd[1], oprnd[0] * oprnd[1]);
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "/"){
      fprintf(yyout, "%lf / %lf = %.4lf\n", oprnd[0], oprnd[1], oprnd[0] / oprnd[1]);
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "log"){
      fprintf(yyout, "log(%lf) = %.4lf\n", oprnd[0], log10(oprnd[0]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "ln"){
      fprintf(yyout, "ln(%lf) = %.4lf\n", oprnd[0], log(oprnd[0]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "cos"){
      fprintf(yyout, "cos(%lf) = %.4lf\n", oprnd[0], cos(PI / 180 * oprnd[0]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "sin"){
      fprintf(yyout, "sin(%lf) = %.4lf\n", oprnd[0], sin(PI / 180 * oprnd[0]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "tan"){
      fprintf(yyout, "tan(%lf) = %.4lf\n", oprnd[0], tan(PI / 180 * oprnd[0]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "pow"){
      fprintf(yyout, "pow(%lf, %lf) = %.4lf\n", oprnd[0], oprnd[1], pow(oprnd[0], oprnd[1]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "root"){
      fprintf(yyout, "root(%lf, %lf) = %.4lf\n", oprnd[0], oprnd[1], pow(oprnd[0], 1.0 / oprnd[1]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "fact"){
      fprintf(yyout, "fact(%lf) = %.4lf\n", oprnd[0], factorial(oprnd[0]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "abs"){
      fprintf(yyout, "abs(%lf) = %.4lf\n", oprnd[0], abs(oprnd[0]));
      oprnd.clear();
      oprtr = "";
    }
    else if(oprtr == "gcd"){
      fprintf(yyout, "gcd(%lf, %lf) = %.4lf\n", oprnd[0], oprnd[1], (double) gcd((int)oprnd[0], (int)oprnd[1]));
      oprnd.clear();
      oprtr = "";
    }
    else
      fprintf(yyout, "thank you\n");
}

double factorial(double n){
  double res = 1;
  for(double i = 1; i <= n; i++){
    res *= i;
  }
  return res;
}

int gcd(int a, int b){
    if (a == 0)
        return b;
    return gcd(b % a, a);
}
