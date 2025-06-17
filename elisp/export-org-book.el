(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("org" . "https://orgmode.org/elpa/")))
  (package-initialize))

(use-package org
  :ensure t)

(use-package ox-zenn
   :ensure t)

(require 'org)

(with-temp-buffer
  (insert-file-contents (car argv))
  (org-mode)
  (let* (;; */zenn/org-books/my-org-book.el
         (src-file (expand-file-name (car argv)))
         ;; */zenn/org-books
         (org-dir (file-name-directory src-file))
         ;; */zenn
         (zenn-dir (file-name-directory (directory-file-name org-dir)))
         ;; my-org-book
         (book-name (file-name-sans-extension (file-name-nondirectory src-file)))
         ;; */zenn/books/my-org-book/
         (book-dir (concat zenn-dir "books/" book-name "/")))
    (print book-dir)

    (unless (file-directory-p book-dir)
      (make-directory book-dir t))
    (cd book-dir)

    (let ((org-confirm-babel-tangle nil))
      (org-babel-tangle))

    (org-map-entries
     (lambda ()
       (let ((title (org-entry-get nil "ITEM")))
         (unless (string= (org-get-todo-state) "TODO")
           ;; (message title)
           (org-zenn-export-to-markdown nil t))))
     "LEVEL=1")))


