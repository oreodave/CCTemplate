;; start.el --- Starting elisp script for Emacs
;;; Commentary:
;;; Provides a simple, completing-read based interface to interactively generate the project
;;; Substitutes for start.sh if using Emacs
;;; Code:

(let ((dx:cc-type (completing-read "Enter type of project: " '(c cpp) nil t))
      (dx:cc-project-name (completing-read "Enter name of project: " nil nil t)))
  (ignore-errors
    (make-directory "dist")
    (make-directory "includes")
    (make-empty-file "README.org")
    (delete-file "start.sh")
    (delete-file "LICENSE")
    (delete-file "start.el"))
  (when (string= dx:cc-type "cpp")
    (delete-file "src/main.c")
    (with-temp-buffer (find-file "CMakeLists.txt")
      (replace-string "main" dx:cc-project-name)
      (replace-string ".c" ".cpp")
      (replace-string ".h" ".hpp")
      (replace-string "${THIS} C" "${THIS} CXX")
      (save-buffer))
    (with-temp-buffer (find-file "src/main.cpp")
      (insert "#include<iostream>

using std::cout;
using std::endl;

int main()
{
  cout << \"Hello, world!\" << endl;
  return 0;
}
")
      (save-buffer)))
  (with-temp-buffer (find-file "Makefile")
    (replace-string "main" dx:cc-project-name)))

(provide 'start)
;;; start.el ends here