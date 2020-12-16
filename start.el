;; start.el --- Starting elisp script for Emacs
;;; Commentary:
;;; Provides a simple, completing-read based interface to interactively generate the project
;;; Substitutes for start.sh if using Emacs
;;; Code:

(let ((dx:cc-type (completing-read "Enter type of project: " '(c cpp) nil t))
       (dx:cc-project-name (completing-read "Enter name of project: " nil)))
  (shell-command (format "sh start.sh %s %s" dx:cc-type dx:cc-project-name)))

(provide 'start)
;;; start.el ends here
