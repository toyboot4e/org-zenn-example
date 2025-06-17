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
(require 'ox-zenn)

(with-temp-buffer
  (insert-file-contents (car argv))
  (let* (;; */zenn/org-articles/my-org-article.el
         (src-file (expand-file-name (car argv)))
         ;; */zenn/org-articles
         (org-dir (file-name-directory src-file))
         ;; */zenn
         (zenn-dir (file-name-directory (directory-file-name org-dir)))
         ;; */zenn/articles/
         (article-dir (concat zenn-dir "articles/"))
         ;; my-org-article
         (file-name (concat (file-name-sans-extension (file-name-nondirectory src-file)) ".md"))
         ;; */zenn/articles/my-org-article
         (dst-path (concat article-dir file-name)))
    ;; (print src-file)
    ;; (print org-dir)
    ;; (print zenn-dir)
    ;; (print article-dir)
    ;; (print file-name)
    (print dst-path)
    (org-export-to-file 'zennmd dst-path)))

