grammar Number;

@header {
    import com.lola.lang.parser.NumberSystemHelper;
}

number: integer | floatingPoint;

integer: DECIMAL_INTEGER | expDecimalInteger | notDecimalInteger;
expDecimalInteger: DECIMAL_INTEGER ('e'|'E') DECIMAL_INTEGER;
notDecimalInteger: XN_NUM;

floatingPoint: decimalFloat | expDecimalFloat | notDecimalFloat;
simpleDecimalFloat: DECIMAL_INTEGER '.' DECIMAL_INTEGER;
periodicDecimalFloat: DECIMAL_INTEGER '.' DECIMAL_INTEGER? '(' DECIMAL_INTEGER ')';
decimalFloat: simpleDecimalFloat | periodicDecimalFloat;
expDecimalFloat: decimalFloat ('e'|'E') MINUS? (decimalFloat | DECIMAL_INTEGER);
notDecimalFloat: notDecimalInteger '.' notDecimalInteger;

DECIMAL_INTEGER: DIGIT | DIGIT (DIGIT | '`')* DIGIT;

MINUS: '-';

DIGIT: [0-9];
X: ('x'|'X');
XN_NUM: BASE X {NumberSystemHelper.isValidNumber(getText())}? (X36_DIGIT | X36_DIGIT (X36_DIGIT | '`')* X36_DIGIT);
fragment X36_DIGIT: [0-9a-zA-Z];
fragment BASE: [2-9] | '1' [0-9] | '2' [0-9] | '3' [0-6];