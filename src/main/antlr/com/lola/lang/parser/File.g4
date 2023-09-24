grammar File;

import expression;

file: expression? ('\n' expression)* EOF;