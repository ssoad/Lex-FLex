from ast import operator
import os
import subprocess
keyword  = []
identifier = []
parenthesis = []
comma = []
number = []
operator = []
result = subprocess.run(['./a.out', '-l'], stdout=subprocess.PIPE)
result = str(result.stdout)
result = result[1:-2].replace('"', '')
ls = result.split(',')
for i in ls:
    if "Keyword" in i: 
        keyword.append(i.split('=>')[-1].lstrip())
    elif "Identifier" in i: 
        identifier.append(i.split('=>')[-1].lstrip())
    elif "Number" in i: 
        number.append(i.split('=>')[-1].lstrip())
    elif "Comma" in i: 
        comma.append(i.split('=>')[-1].lstrip())
    elif "Parenthesis" in i: 
        parenthesis.append(i.split('=>')[-1].lstrip())
    elif "Operator" in i: 
        operator.append(i.split('=>')[-1].lstrip())

print("Keyword:", keyword)
print("Operator:", operator)
print("Identifier:", identifier)
print("Number:", number)
print("Comma:", comma)
print("Parenthesis:", parenthesis)