(exec-path-from-shell-initialize)

(setq mac-function-modifier 'hyper)

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
