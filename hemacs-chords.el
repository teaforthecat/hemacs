;; keychord
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define-global "<>" 'sgml-close-tag)
(key-chord-define-global "{}" 'open-brackets-newline-and-indent)
(key-chord-define-global "_+" 'arrow)
(key-chord-define-global "]\\" 'toggle-split-window-horizontally)
(key-chord-define-global "qr" 'query-replace)

;; semi-colon chordage

;; buffer hopping
(key-chord-define-global ";b" 'hemacs-jump-buff)
(key-chord-define-global ";s" 'ido-switch-buffer)
(key-chord-define-global ";r" 'recentf-ido-find-file)
(key-chord-define-global ";t" 'projectile-find-file)
(key-chord-define-global ";f" 'ido-find-file)

;; shells
(key-chord-define-global ";x" 'ido-shell-buffer-in-persp)
(key-chord-define-global ";c" 'switch-to-or-create-project-shell)

;; project-ish
(key-chord-define-global ";'" 'magit-in-perspective)
(key-chord-define-global ";l" 'persp-switch)
(key-chord-define-global ";," 'magit-status)
(key-chord-define-global ";k" 'ack-and-a-half)
(key-chord-define-global ";g" 'ag-project-at-point)

;; editing
(key-chord-define-global ";z" 'zap-up-to-char)

;; todos
(key-chord-define-global ";e" 'hemacs-todo-capture)
(key-chord-define-global ";i" 'hemacs-goto-todos)

(provide 'hemacs-chords)
