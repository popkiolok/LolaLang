grammar Expression;

import Variable;

expression: inlineExpression | fulllineExpression;

inlineExpression: variableUsage;
fulllineExpression: variableAssigment;