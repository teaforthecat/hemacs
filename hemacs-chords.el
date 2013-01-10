;; keychord
(vendor 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "<>" 'sgml-close-tag)
(key-chord-define-global "{}" 'open-brackets-newline-and-indent)
(key-chord-define-global ";s" 'ido-switch-buffer)
(key-chord-define-global ";f" 'ido-find-file)
(key-chord-define-global ";g" 'magit-status)
(key-chord-define-global ";m" 'ace-jump-mode)
(key-chord-define-global "_+" 'arrow)

(provide 'hemacs-chords)
