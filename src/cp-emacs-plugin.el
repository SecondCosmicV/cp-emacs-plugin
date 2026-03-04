(defun cp/new ()
  (interactive)
  (let ((problem-id (read-string "Problem ID: ")))
    (copy-directory
      "~/.local/share/cp-emacs-plugin/template"
      (expand-file-name problem-id)))
  (revert-buffer))
(defun cp/build ()
  (interactive)
  (compile "g++ -g -Wall -o main main.cpp"))
(defun cp/test ()
  (interactive)
  (let ((buff (get-buffer-create "*cp-test-results*")))
    (display-buffer buff)
    (let ((wd default-directory))
      (with-current-buffer buff
        (setq-local default-directory wd)
        (erase-buffer)
        (let ((test-case 1))
          (while (file-exists-p (format "in%d.txt" test-case))
            (insert (format "%d. " test-case))
            (let ((actual (shell-command-to-string (format "./main < in%d.txt" test-case)))
                  (correct (with-temp-buffer
                             (insert-file-contents (format "out%d.txt" test-case))
                             (buffer-string))))
              (if (string-equal
                    (string-trim actual)
                    (string-trim correct))
                (insert "AC")
                (insert "WA")))
              (insert "\n")
            (setq test-case (+ test-case 1))))))))
(defvar cp/cp-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<f5>") 'cp/test)
    (define-key map (kbd "<f6>") 'cp/build)
    map))
(define-minor-mode cp/cp-mode
  "Minor mode for competitive programming."
  :lighter "CP"
  :keymap cp/cp-mode-map)
(provide 'cp-emacs-plugin)

