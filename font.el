;; using this font = https://github.com/andreberg/Meslo-Font

;; default set to 15pt
(set-face-attribute 'default nil :font "-apple-Meslo_LG_M_DZ-medium-normal-normal-*-15-*-*-*-m-0-fontset-auto3")

(custom-set-faces
 '(mode-line ((t (:box nil :height 120))))
 '(mode-line-inactive ((t (:box nil :height 120))))
 )

;; bump shell modes down to 12pt
(dolist (hook '(comint-mode-hook
                ))
  (add-hook hook '(lambda ()
                    (face-remap-add-relative 'default '(:height 120))
                    (face-remap-add-relative 'ac-candidate-face '(:height 120))
                    (face-remap-add-relative 'ac-candidate-mouse-face '(:height 120))
                    (face-remap-add-relative 'ac-completion-face '(:height 120))
                    (face-remap-add-relative 'ac-selection-face '(:height 120))
                    (face-remap-add-relative 'popup-face '(:height 120))
                    (face-remap-add-relative 'popup-menu-face '(:height 120))
                    (face-remap-add-relative 'popup-isearch-match-face '(:height 120))
                    (face-remap-add-relative 'popup-menu-mouse-face '(:height 120))
                    (face-remap-add-relative 'popup-menu-selection-face '(:height 120))
                    (face-remap-add-relative 'popup-scroll-bar-background-face '(:height 120))
                    (face-remap-add-relative 'popup-scroll-bar-foreground-face '(:height 120))
                    (face-remap-add-relative 'popup-tip-face '(:height 120))
                    )))

;; bump fix the autocomplete faces to 160pt + remove the box around powerline

(provide 'font)
