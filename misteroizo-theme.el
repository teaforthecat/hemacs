(deftheme misteroizo
  "Created 2013-01-22.")

(custom-theme-set-variables
 'misteroizo
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"]))

(custom-theme-set-faces
 'misteroizo
 '(cursor ((((class color) (min-colors 89)) (:background "#34cae2"))))
 '(highlight ((((class color) (min-colors 89)) (:background "#008b8b"))))
 '(region ((((class color) (min-colors 89)) (:background "#222222" :foreground "#e1e1e0"))))

 '(fringe ((((class color) (min-colors 89)) (:background "#3a3a3a" :foreground "#3a3a3a"))))
 '(linum ((((class color) (min-colors 89)) (:height 0.8125 :foreground "#666666"))))

 '(header-line ((((class color) (min-colors 89)) (:background "#2d3743" :foreground "#e1e1e0" :height 160 :weight bold))))

 '(isearch ((((class color) (min-colors 89)) (:background "#fcffad" :foreground "#000000"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:background "#338f86"))))

 '(vertical-border ((((class color) (min-colors 89)) (:foreground "#666666"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) (:background "#ff4242"))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:foreground "#729fcf" :weight bold))))

 '(mode-line ((((class color) (min-colors 89)) (:background "#222222" :foreground "#eeeeec" :height 120 :box nil))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:background "#666666" :foreground "#eeeeec" :height 120 :box nil))))

 '(diff-added ((((class color) (min-colors 89)) (:foreground "#74af68"))))
 '(diff-changed ((((class color) (min-colors 89)) (:foreground "#dbdb95"))))
 '(diff-header ((((class color) (min-colors 89)) (:foreground "#212931"))))
 '(diff-hunk-header ((((class color) (min-colors 89)) (:inherit nil))))
 '(diff-file-header ((((class color) (min-colors 89)) (:inherit nil))))
 '(diff-removed ((((class color) (min-colors 89)) (:foreground "#ff4242"))))
 '(success ((((class color) (min-colors 89)) (:foreground "#74af68"))))

 '(ido-first-match ((((class color) (min-colors 89)) (:foreground "#ffffff"))))
 '(ido-subdir ((((class color) (min-colors 89)) (:foreground "#ffad29"))))

 '(magit-section-title ((((class color) (min-colors 89)) (:foreground "#dbdb95" :weight bold))))
 '(magit-item-highlight ((((class color) (min-colors 89)) (:background "#415160"))))

 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#23d7d7"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#74af68"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#008b8b"))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "#74af68"))))
 '(font-lock-doc-string-face ((((class color) (min-colors 89)) (:foreground "#23d7d7"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#00ede1" :weight bold))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#ffad29" :weight bold))))
 '(font-lock-preprocessor ((((class color) (min-colors 89)) (:foreground "#00ede1" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#e67128"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#34cae2"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#dbdb95"))))
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:foreground "#ff4242" :weight bold))))

 '(ac-candidate-face ((((class color) (min-colors 89)) (:background "#666666" :foreground "#eeeeec"))))
 '(ac-selection-face ((((class color) (min-colors 89)) (:background "#34cae2" :foreground "#000000"))))

 '(button ((((class color) (min-colors 89)) (:underline t))))
 '(link ((((class color) (min-colors 89)) (:foreground "#59e9ff" :underline t))))
 '(link-visited ((((class color) (min-colors 89)) (:foreground "#ed74cd" :underline t))))

 '(gnus-group-news-1 ((((class color) (min-colors 89)) (:foreground "#ff4242" :weight bold))))
 '(gnus-group-news-1-low ((((class color) (min-colors 89)) (:foreground "#ff4242"))))
 '(gnus-group-news-2 ((((class color) (min-colors 89)) (:foreground "#00ede1" :weight bold))))
 '(gnus-group-news-2-low ((((class color) (min-colors 89)) (:foreground "#00ede1"))))
 '(gnus-group-news-3 ((((class color) (min-colors 89)) (:foreground "#23d7d7" :weight bold))))
 '(gnus-group-news-3-low ((((class color) (min-colors 89)) (:foreground "#23d7d7"))))
 '(gnus-group-news-4 ((((class color) (min-colors 89)) (:foreground "#74af68" :weight bold))))
 '(gnus-group-news-4-low ((((class color) (min-colors 89)) (:foreground "#74af68"))))
 '(gnus-group-news-5 ((((class color) (min-colors 89)) (:foreground "#dbdb95" :weight bold))))
 '(gnus-group-news-5-low ((((class color) (min-colors 89)) (:foreground "#dbdb95"))))
 '(gnus-group-news-low ((((class color) (min-colors 89)) (:foreground "#008b8b"))))
 '(gnus-group-mail-1 ((((class color) (min-colors 89)) (:foreground "#ff4242" :weight bold))))
 '(gnus-group-mail-1-low ((((class color) (min-colors 89)) (:foreground "#ff4242"))))
 '(gnus-group-mail-2 ((((class color) (min-colors 89)) (:foreground "#00ede1" :weight bold))))
 '(gnus-group-mail-2-low ((((class color) (min-colors 89)) (:foreground "#00ede1"))))
 '(gnus-group-mail-3 ((((class color) (min-colors 89)) (:foreground "#23d7d7" :weight bold))))
 '(gnus-group-mail-3-low ((((class color) (min-colors 89)) (:foreground "#23d7d7"))))
 '(gnus-group-mail-low ((((class color) (min-colors 89)) (:foreground "#008b8b"))))
 '(gnus-header-content ((((class color) (min-colors 89)) (:weight normal :foreground "#ffad29"))))
 '(gnus-header-from ((((class color) (min-colors 89)) (:foreground "#e67128" :weight bold))))
 '(gnus-header-subject ((((class color) (min-colors 89)) (:foreground "#dbdb95"))))
 '(gnus-header-name ((((class color) (min-colors 89)) (:foreground "#00ede1"))))
 '(gnus-header-newsgroups ((((class color) (min-colors 89)) (:foreground "#e67128"))))
 '(message-header-name ((((class color) (min-colors 89)) (:foreground "#ffad29" :weight bold))))
 '(message-header-cc ((((class color) (min-colors 89)) (:foreground "#e67128"))))
 '(message-header-other ((((class color) (min-colors 89)) (:foreground "#e67128"))))
 '(message-header-subject ((((class color) (min-colors 89)) (:foreground "#dbdb95"))))
 '(message-header-to ((((class color) (min-colors 89)) (:foreground "#00ede1"))))
 '(message-cited-text ((((class color) (min-colors 89)) (:foreground "#74af68"))))
 '(message-separator ((((class color) (min-colors 89)) (:foreground "#23d7d7"))))

 '(default ((((class color) (min-colors 89)) (:background "#3a3a3a" :height 160 :foreground "#e1e1e0")))))

(provide-theme 'misteroizo)
