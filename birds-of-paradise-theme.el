(deftheme birds-of-paradise
  "Created 2013-02-25.")

(custom-theme-set-variables
 'birds-of-paradise
 '(ansi-color-names-vector ["#1F1611" "#FF7575" "#8CFF8C" "#EFAC32" "#6C99BB" "#BE73FD" "#7DAF9C" "#E6E1C4"]))

(custom-theme-set-faces
 'birds-of-paradise
 '(cursor ((t (:foreground "#865C38" :background "#E6E1C4"))))
 '(highlight ((t (:background "#1F1611" :foreground "#E6E1C4"))))
 '(hl-line ((t (:background "#3E2929"))))
 '(region ((t (:background "#000000"))))
 '(escape-glyph ((t (:foreground "#BE73FD"))))
 '(minibuffer-prompt ((t (:foreground "#6C99BB"))))
 '(font-lock-builtin-face ((t (:foreground "#6C99BB"))))
 '(font-lock-constant-face ((t (:foreground "#6C99BB"))))
 '(font-lock-comment-face ((t (:italic t :foreground "#6B4E32"))))
 '(font-lock-doc-face ((t (:foreground "#865C38"))))
 '(font-lock-doc-string-face ((t (:foreground "#865C38"))))
 '(font-lock-function-name-face ((t (:foreground "#EFAC32"))))
 '(font-lock-keyword-face ((t (:foreground "#EF5D32"))))
 '(font-lock-negation-char-face ((t (:foreground "#7DAF9C"))))
 '(font-lock-preprocessor-face ((t (:foreground "#BE3250"))))
 '(font-lock-string-face ((t (:foreground "#D9D762"))))
 '(font-lock-type-face ((t (:bold t :foreground "#EFAC32"))))
 '(font-lock-variable-name-face ((t (:foreground "#7DAF9C"))))
 '(font-lock-warning-face ((t (:background "#990000" :foreground "white"))))
 '(link ((t (:foreground "#D9D762"))))
 '(button ((t (:foreground "#D9D762" :background "#7DAF9C" :weight bold :underline t))))
 '(mode-line ((t (:background "#865C38" :foreground "#E6E1C4" :height 110 :box nil))))
 '(mode-line-inactive ((t (:background "#5C413D" :foreground "#E6E1C4" :height 110 :box nil))))
 '(powerline-active1 ((t (:background "#3D2B28"))))
 '(powerline-active2 ((t (:background "#5C413D"))))
 '(powerline-inactive1 ((t (:background "#3D2B28"))))
 '(powerline-inactive2 ((t (:background "#5C413D"))))
 '(vertical-border ((t (:foreground "#5C413D"))))
 '(fringe ((t (:background "#3D2B28" :foreground "#5C413D"))))
 '(linum ((t (:background "#3D2B28" :foreground "#5C413D"))))
 '(show-paren-match ((t (:background "#7D504A"))))
 '(show-paren-mismatch ((t (:inherit font-lock-warning-face))))
 '(ido-only-match ((t (:foreground "#EF5D32"))))
 '(ido-subdir ((t (:foreground "#EFAC32"))))
 '(highlight-indentation-face ((t (:background "#4B3330"))))
 '(highlight-indentation-current-column-face ((t (:background "#523D2B"))))
 '(whitespace-empty ((t (:background "#EFAC32"))))
 '(whitespace-hspace ((t (:foreground "#523D2B"))))
 '(whitespace-indentation ((t (:foreground "#523D2B"))))
 '(whitespace-line ((t (:background "#4e4e4e"))))
 '(whitespace-newline ((t (:foreground "#523D2B"))))
 '(whitespace-space ((t (:foreground "#523D2B"))))
 '(whitespace-space-after-tab ((t (:foreground "#523D2B"))))
 '(whitespace-tab ((t (:foreground "#523D2B"))))
 '(whitespace-trailing ((t (:background "#CC4232"))))
 '(flyspell-incorrect ((t (:underline "firebrick4"))))
 '(flyspell-duplicate ((t (:underline "firebrick4"))))
 '(compilation-info ((t (:foreground "#D9D762"))))
 '(diff-added ((t (:foreground "#8CFF8C"))))
 '(diff-removed ((t (:foreground "#FF7575"))))
 '(diff-header ((t (:background nil))))
 '(diff-hunk-header ((t (:background "#5C413D"))))
 '(diff-file-header ((t (:background "#5C413D"))))
 '(git-gutter-fr:added ((t (:foreground "#523D2B"))))
 '(git-gutter-fr:deleted ((t (:foreground "#523D2B"))))
 '(git-gutter-fr:modified ((t (:foreground "#523D2B"))))
 '(magit-diff-add ((t (:foreground "#8CFF8C"))))
 '(magit-diff-del ((t (:foreground "#FF7575"))))
 '(magit-item-highlight ((t (:background "#1F1611" :foreground nil))))
 '(ecb-default-highlight-face ((t (:background "#990000"))))
 '(elscreen-tab-background-face ((t (:background "#4B3330"))))
 '(elscreen-tab-control-face ((t (:background "#865C38" :foreground "#E6E1C4" :underline nil))))
 '(elscreen-tab-current-screen-face ((t (:background "#865C38" :foreground "#E6E1C4"))))
 '(elscreen-tab-other-screen-face ((t (:background "#4B3330" :foreground "#E6E1C4" :underline nil))))
 '(column-marker-1 ((t (:background "#523D2B"))))
 '(gnus-group-news-1 ((t (:foreground "#D9D762" :weight bold))))
 '(gnus-group-news-1-empty ((t (:foreground "#D9D762"))))
 '(gnus-group-news-2 ((t (:foreground "#EF5D32" :weight bold))))
 '(gnus-group-news-2-empty ((t (:foreground "#EF5D32"))))
 '(gnus-group-news-3 ((t (:foreground "#CC4232" :weight bold))))
 '(gnus-group-news-3-empty ((t (:foreground "#CC4232"))))
 '(gnus-group-news-4 ((t (:foreground "#BB99BB" :weight bold))))
 '(gnus-group-news-4-empty ((t (:foreground "#BB99BB"))))
 '(gnus-group-news-5 ((t (:foreground "#7DAF9C" :weight bold))))
 '(gnus-group-news-5-empty ((t (:foreground "#7DAF9C"))))
 '(gnus-group-news-6 ((t (:foreground "#6C99BB" :weight bold))))
 '(gnus-group-news-6-empty ((t (:foreground "#6C99BB"))))
 '(gnus-group-news-low ((t (:foreground "#865C38" :italic t))))
 '(gnus-group-news-low-empty ((t (:foreground "#865C38"))))
 '(gnus-group-mail-1 ((t (:foreground "#D9D762" :weight bold))))
 '(gnus-group-mail-1-empty ((t (:foreground "#D9D762"))))
 '(gnus-group-mail-2 ((t (:foreground "#EF5D32" :weight bold))))
 '(gnus-group-mail-2-empty ((t (:foreground "#EF5D32" :weight bold))))
 '(gnus-group-mail-3 ((t (:foreground "#CC4232" :weight bold))))
 '(gnus-group-mail-3-empty ((t (:foreground "#CC4232"))))
 '(gnus-group-mail-low ((t (:foreground "#865C38" :italic t))))
 '(gnus-group-mail-low-empty ((t (:foreground "#865C38"))))
 '(gnus-header-content ((t (:weight normal :foreground "#D9D762"))))
 '(gnus-header-from ((t (:foreground "#D9D762"))))
 '(gnus-header-subject ((t (:foreground "#CC4232"))))
 '(gnus-header-name ((t (:foreground "#6C99BB"))))
 '(gnus-header-newsgroups ((t (:foreground "#EFAC32"))))
 '(message-header-name ((t (:foreground "#EF5D32"))))
 '(message-header-cc ((t (:foreground "#865C38"))))
 '(message-header-other ((t (:foreground "#865C38"))))
 '(message-header-subject ((t (:foreground "#E6E1C4"))))
 '(message-header-to ((t (:foreground "#E6E1C4"))))
 '(message-cited-text ((t (:foreground "#EFAC32"))))
 '(message-separator ((t (:foreground "#EFAC32"))))
 '(nxml-comment-content ((t (:inherit (quote font-lock-comment-face)))))
 '(nxml-tag-delimiter ((t (:foreground "#EFCB43"))))
 '(nxml-processing-instruction-target ((t (:foreground "#865C38"))))
 '(nxml-entity-ref-delimiter ((t (:foreground "#6C99BB"))))
 '(nxml-entity-ref-name ((t (:foreground "#6C99BB"))))
 '(nxml-element-local-name ((t (:foreground "#EFCB43"))))
 '(nxml-cdata-section-content ((t (:foreground "#CC4232"))))
 '(nxml-attribute-local-name ((t (:foreground "#EF5D32"))))
 '(nxml-attribute-value ((t (:foreground "#D9D762"))))
 '(default ((t (:background "#372725" :foreground "#E6E1C4")))))

(provide-theme 'birds-of-paradise)
