;; (defun set-exec-path-from-shell-PATH ()
;;   "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
;;      This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
;;   (interactive)
;;   (let ((path-from-shell (string-rtrim (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (set-exec-path-from-shell-PATH)

(exec-path-from-shell-initialize)

;; delete to an emacs folder in trash
(setq delete-by-moving-to-trash t)
(setq trash-directory "~/.Trash/emacs")

;; use default osx browser
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; no pop-up windows
(setq ns-pop-up-frames nil)

;; clipboard
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq x-select-enable-clipboard t)
(setq kill-do-not-save-duplicates t)
;; (setq save-interprogram-paste-before-kill t)

(provide 'hemacs-osx)
