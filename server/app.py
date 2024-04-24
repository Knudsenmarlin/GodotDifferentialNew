import sympy
from sympy import *
import math
from flask import Flask, jsonify, request
import re
app = Flask(__name__)


@app.route('/')
def home():
    return 'Hello World, from Flask!'

@app.route('/diff', methods=['POST'])
def processDiff():
    data = request.get_json()
    expr1 = data['expr1']
    expr2 = data['expr2']
    x = symbols("x") 
    diffExpr1 = str(diff(expr1, x))
    diffExpr2 = str(diff(expr2, x))
   
    return jsonify({'diffExpr1': diffExpr1, 'diffExpr2': diffExpr2})

@app.route('/diffHard', methods=['POST'])
def processDiffHard():
    data = request.get_json()
    exprHard = data['exprHard']
    x = symbols("x")
    diffExprHard = str(diff(exprHard, x))
    print("success")
    return jsonify({'diffExprHard': diffExprHard})

@app.route('/diffCheck', methods=['POST'])
def diffCheck():
    data = request.get_json()
    diffInput1 = data['diffInput1']
    diffInput2 = data['diffInput2']
    diffExpr1 = data['diffExpr1']
    diffExpr2 = data['diffExpr2']
    x = symbols('x')
    if diffInput1 != "" and diffInput2 != "" and diffExpr1 != "" and diffExpr2 != "":
        diffInput1 = sympify(replace_e_power_x_with_exp(diffInput1))
        diffInput2 = sympify(replace_e_power_x_with_exp(diffInput2))
        diffExpr1 = sympify(data['diffExpr1'])
        diffExpr2 = sympify(data['diffExpr2'])
        if diffInput1.equals(diffExpr1) and diffInput2.equals(diffExpr2):
            return jsonify({'answer': "success"})
        else:
            return jsonify({'answer': "failed"})
    else:
        return jsonify({'answer': "failed"})
   
    

def replace_e_power_x_with_exp(input_string):
    # Define a regular expression pattern to match "e^x"
    pattern = r'e\^(\S+)'
    # Use re.sub() function to replace matched patterns with "exp(x)"
    replaced_string = re.sub(pattern, r'exp(\1)', input_string)

    return replaced_string


if __name__ == '__main__':
    app.run()
