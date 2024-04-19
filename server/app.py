import sympy
from sympy import *
import math
from flask import Flask, jsonify, request
app = Flask(__name__)



@app.route('/')
def home():
    return 'Hello World, from Flask!'

@app.route('/diff', methods=['POST'])
def processjson():
    data = request.get_json()
    expr1 = data['expr1']
    expr2 = data['expr2']
    x = symbols("x") 
    diffExpr1 = str(diff(expr1, x))
    diffExpr1 = diffExpr1.replace("**", "^")
    if 'exp' in diffExpr1:
        diffExpr1 = diffExpr1.replace("exp(", "e**")
        diffExpr1 = diffExpr1.replace(")", "")
        diffExpr1 = diffExpr1.replace("**", "^")
    else:
        print('no, didnt have')
    diffExpr2 = str(diff(expr2, x))
    diffExpr2 = diffExpr2.replace("**", "^")
    if 'exp' in diffExpr2:
        diffExpr2 = diffExpr2.replace("exp(", "e**")
        diffExpr2 = diffExpr2.replace(")", "")
        diffExpr2 = diffExpr2.replace("**", "^")
    else:
        print('no, didnt have')
   
    return jsonify({'diffExpr1': diffExpr1, 'diffExpr2': diffExpr2})

if __name__ == '__main__':
    app.run()

