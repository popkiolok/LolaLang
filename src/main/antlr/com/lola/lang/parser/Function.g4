grammar Function;

import Commons, Type, Expression;

functionDeclaration: inlineFunction | multilineFunction;

inlineFunction: description SPACE* '=>' SPACE* inlineExpression;
multilineFunction: description SPACE* '\n' (('\t'|'    ') expression)+;

thisType: type;

description: (thisType SPACE* '.')? SPACE* arguments? SPACE* (':' SPACE* type)?;
arguments: '(' SPACE* argument SPACE* (',' argument SPACE*)* ')';
argument: SIMPLE_NAME SPACE* ':' SPACE* type;