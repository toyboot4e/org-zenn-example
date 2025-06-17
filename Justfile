# Just a task runner
# <https://github.com/casey/just>

# shows this help message
help:
    @just -l

article file:
    emacs -q --script elisp/export-org-article.el {{file}}

[private]
alias a := article

book file:
    emacs -q --script elisp/export-org-book.el {{file}}

[private]
alias b := book


