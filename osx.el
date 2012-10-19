(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
     This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (string-rtrim (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

;; delete to an emacs folder in trash
(setq delete-by-moving-to-trash t)
(setq trash-directory "~/.Trash/emacs")

;; use default osx browser
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; font anti aliasing
(setq mac-allow-anti-aliasing t)

;; no pop-up windows
(setq ns-pop-up-frames nil)

;; clipboard
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq x-select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)

;; enhanced ruby
;; (setq enh-ruby-program (rbenv which ruby)) ; so that still works if ruby points to ruby1.8
;; (require 'ruby-mode)

(provide 'osx)
