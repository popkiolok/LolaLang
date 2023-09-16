grammar Comment;

comment: InlineComment | MultiLineComment;

InlineComment: '#' .+? ('#'|'\n'|EOF);
MultiLineComment: '##' (.|'\r'|'\n')+? '##';