;; electric pair with overrides

(defadvice delete-active-region (around electric-pair-or-delete-active-region
                                        activate)
  "Prevent delete-active-region from clobbering electric-pair-mode."
  (unless (and electric-pair-mode
               (or (eq ?\( (char-syntax last-command-event))
                   (assq last-command-event electric-pair-pairs)))
    ad-do-it)
  t)

(defadvice backward-delete-char-untabify (before electric-pair-backspace
                                                 activate)
  "When deleting the beginning of a pair, and the ending is next char, delete it too."
  (let ((pair (assq (preceding-char) electric-pair-pairs)))
    (and pair
         (eq (following-char) (rest pair))
         (delete-char 1))))

(defadvice delete-backward-char (before electric-pair-backspace
                                        activate)
  "When deleting the beginning of a pair, and the ending is next char, delete it too."
  (let ((pair (assq (preceding-char) electric-pair-pairs)))
    (and pair
         (eq (following-char) (rest pair))
         (delete-char 1))))

;; always electric -> () {} [] || <> ""
(setq electric-pair-pairs (quote ((60 . 62) (124 . 124) (91 . 93) (40 . 41) (123 . 125) (34 . 34)))      
      electric-pair-skip-self nil)

(electric-pair-mode t)

(provide 'hemacs-pairs)
