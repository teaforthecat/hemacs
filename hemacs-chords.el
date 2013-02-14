;; keychord
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define-global "<>" 'sgml-close-tag)
(key-chord-define-global "{}" 'open-brackets-newline-and-indent)
(key-chord-define-global "_+" 'arrow)
(key-chord-define-global "]\\" 'split-window-horizontally-previous-buffer-select)
(key-chord-define-global "qr" 'query-replace)

;; semi-colon chordage
(key-chord-define-global ";'" 'ido-switch-buffer)
(key-chord-define-global ";r" 'recentf-ido-find-file)
(key-chord-define-global ";f" 'ido-find-file)
(key-chord-define-global ";g" 'magit-status)
(key-chord-define-global ";x" 'smex)
(key-chord-define-global ";z" 'zap-up-to-char)
(key-chord-define-global ";m" 'jump-char-forward)
(key-chord-define-global ";," 'ace-jump-mode)
(key-chord-define-global ";c" 'hemacs-todo-capture)
(key-chord-define-global ";t" 'hemacs-goto-todos)
(key-chord-define-global ";o" 'magit-in-perspective)
(key-chord-define-global ";s" 'persp-switch)
(key-chord-define-global ";l" 'persp-shell)
(key-chord-define-global ";d" 'dired-jump-other-window)
(key-chord-define-global ";a" 'ack-and-a-half)

(provide 'hemacs-chords)
