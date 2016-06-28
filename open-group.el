;;; open-group.el ---                                -*- lexical-binding: t; -*-

;; Copyright (C) 2016  

;; Author: Takashi SUWA


(provide 'open-group)


(defvar open-group-file-name ".emacs-open-group")


(defun open-group/concat-dir (dir name)
  (concat (file-name-as-directory dir) name))


(defun open-group/open-listing-file (dir)
  (with-temp-buffer
    (let ((path (open-group/concat-dir dir open-group-file-name)))
      (progn
	(insert-file-contents path)
	(buffer-string)))))


(defun open-group/find-file-each (dir listing)
  (if (not (equal listing nil))
      (progn
	(find-file (open-group/concat-dir dir (car listing)))
	(open-group/find-file-each dir (cdr listing)))))


(defun open-group (dir)
  (interactive "Ddirectory: ")
  (let ((dirnew (cond ((equal dir nil) (file-name-directory buffer-file-name))
		      (t dir))))
    (let ((listing-string (open-group/open-listing-file dirnew)))
      (let ((listing (split-string listing-string "\n" t)))
	(open-group/find-file-each dirnew listing)))))

;;; open-group.el ends here
