grammar Expression;

import Variable, Function, Literal;

expression: inlineExpression | fulllineExpression;

fulllineExpression: variableDeclaration | variableAssigment;
inlineExpression: variableUsage | functionDeclaration | literal;