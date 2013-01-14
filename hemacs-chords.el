;; keychord
(vendor 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "<>" 'sgml-close-tag)
(key-chord-define-global "{}" 'open-brackets-newline-and-indent)
(key-chord-define-global "_+" 'arrow)

(key-chord-define-global ";b" 'ido-switch-buffer)
(key-chord-define-global ";r" 'recentf-ido-find-file)
(key-chord-define-global ";f" 'ido-find-file)
(key-chord-define-global ";g" 'magit-status)
(key-chord-define-global ";m" 'ace-jump-mode)
(key-chord-define-global ";c" 'hemacs-todo-capture)
(key-chord-define-global ";t" 'hemacs-goto-todos)
(key-chord-define-global ";o" 'magit-in-perspective)
(key-chord-define-global ";s" 'persp-switch)

(provide 'hemacs-chords)
