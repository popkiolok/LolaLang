grammar Type;

import Commons;

type: (typeModifiers SPACE+)? SIMPLE_NAME;

typeModifiers: MUTABLE | INTERNAL_MUTABLE | IMMUTABLE;
MUTABLE: 'mutable';
INTERNAL_MUTABLE: 'internal-mutable';
IMMUTABLE: 'immutable';