grammar Variable;

import Type, Expression;

variable: mutability SPACE* (modifiers SPACE+)? name SPACE* (',' SPACE* name SPACE*)*
          (':' SPACE* type SPACE*)? ('=' SPACE* '4')? inlineExpression;

mutability: CONSTANT | VARIABLE;
CONSTANT: '-';
VARIABLE: '~';

modifiers: PRIVATE | INTERNAL;
PRIVATE: 'private';
INTERNAL: 'internal';

name: SIMPLE_NAME | SIMPLE_OPERATOR | specialOperator;
specialOperator: GET | SET;
GET: '[]';
SET: '[]=';
SIMPLE_NAME: [a-zA-Z_][0-9a-zA-Z_]+;
SIMPLE_OPERATOR: [+\-/*%!&|<>^~]+;

SPACE: (' '|'\r'|'\n'|'\t');