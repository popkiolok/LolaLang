grammar Variable;

import Commons, Type, Expression;

variable: variableMutability SPACE* (variableModifiers SPACE+)? variableName SPACE* (',' SPACE* variableName SPACE*)*
          (':' SPACE* type SPACE*)? ('=' SPACE* inlineExpression)?;

variableMutability: CONSTANT | VARIABLE;
CONSTANT: '-';
VARIABLE: '~';

variableModifiers: PRIVATE | INTERNAL;
PRIVATE: 'private';
INTERNAL: 'internal';

variableName: SIMPLE_NAME | SIMPLE_OPERATOR | specialOperator;
specialOperator: GET | SET;
GET: '[]';
SET: '[]=';
SIMPLE_OPERATOR: [+\-/*%!&|<>^~]+;

variableAssigment: SIMPLE_NAME SPACE* '=' SPACE* inlineExpression;
variableUsage: SIMPLE_NAME;