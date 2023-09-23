grammar Variable;

variable: MODE SPACE* (modifiers SPACE+)? name SPACE* (',' SPACE* name SPACE*)*
          (':' SPACE* 'int' SPACE* /* TODO type description rule*/)? '=' SPACE* '4' /* TODO initialization code rule */;

MODE: ('-'|'~');

modifiers: PRIVATE | INTERNAL;
PRIVATE: 'private';
INTERNAL: 'internal';

name: SIMPLE_NAME | SIMPLE_OPERATOR | specialOperator;
specialOperator: GET | SET;
GET: '[]';
SET: '[]=';
SIMPLE_NAME: [a-zA-Z_][0-9a-zA-Z_]*;
SIMPLE_OPERATOR: [+\-/*%!&|<>^~]+;

SPACE: (' '|'\r'|'\n'|'\t');