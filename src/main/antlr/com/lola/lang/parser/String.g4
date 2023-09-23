grammar String;

string: inlineString;
inlineString: '"' inlineChar* '"';

inlineChar: inlineSpecial | OTHER;
multilineChar: inlineChar | '\r' | '\n';

inlineSpecial: '\\' (unicodeChar | NEW_LINE | DOUBLE_QUOTE | BACKSLASH);

unicodeChar: 'u' UNICODE_CODE;

NEW_LINE: [nN];
SINGLE_QUOTE: '\'';
DOUBLE_QUOTE: '"';
BACKSLASH: '\\';

OTHER: .;
UNICODE_CODE: X X X X;

fragment X: [0-9a-fA-F];