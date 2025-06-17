(with-temp-buffer
  (insert-file-contents (car argv))
  (princ (buffer-string)))
