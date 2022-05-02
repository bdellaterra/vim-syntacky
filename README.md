
vim-syntacky
============

Universal and Language-agnostic Syntax Definitions


Motivation
----------

Are you tired of opening files with weird extensions to find there's no syntax
highlighting? Or over-ambitious syntax plugins that are slow, CPU-intensive and
ultimately don't work very well? Well now you can have one universal syntax
plugin that's less ambitious and doesn't work very well!


Philosophy
----------

Instead of trying to accurately define all the awkward syntax patterns of a
specific language, Syntacky aims to only provide syntax patterns that are easy
to define and appear ubiquitously across many languages. Here's some examples:

- Quote-delimited "string" literals
- Number literals like 123
- Delimiters (), [], {}, <>
- ALL_CAPS_CONSTANTS
- Assigning variable = something
- dot.path.indexing
- scoped:paths:with:colons
- /nav/paths/with/slashes
- Regular expression /^[search]*/ patterns
- Common symbols +-*/%= and Separators |:;,.
- calling functions()
- Pre-processor #MACROS
- Hex Color Codes #abc123
- Prefixed @annotations
- -flags and --options
- <!-- Code Coments -->
- Select keywords like import and return


Licensing
---------

Copyright 2022 Brian Dellaterra
Licensed under the EUPL version 1.2

