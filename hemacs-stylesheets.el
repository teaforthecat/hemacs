(require 'less-css-mode)
(require 'sass-mode)
(require 'stylus-mode)

(setq css-indent-offset 2
      css-reference-list '
      (":active" ":after" "animation" "animation-delay" "animation-direction" "animation-duration"
       "animation-fill-mode" "animation-iteration-count" "animation-name" "animation-play-state"
       "animation-timing-function" "attr" "auto" "backface-visibility" "background"
       "background-attachment" "background-clip" "background-color" "background-image"
       "background-origin" "background-position" "background-repeat" "background-size" ":before"
       "border" "border-bottom" "border-bottom-color" "border-bottom-left-radius"
       "border-bottom-right-radius" "border-bottom-style" "border-bottom-width" "border-collapse"
       "border-color" "border-image" "border-image-outset" "border-image-repeat" "border-image-slice"
       "border-image-source" "border-image-width" "border-left" "border-left-color"
       "border-left-style" "border-left-width" "border-radius" "border-right" "border-right-color"
       "border-right-style" "border-right-width" "border-spacing" "border-style" "border-top"
       "border-top-color" "border-top-left-radius" "border-top-right-radius" "border-top-style"
       "border-top-width" "border-width" "bottom" "box-decoration-break" "box-shadow" "box-sizing"
       "break-after" "break-before" "break-inside" "calc" "caption-side" "@charset" ":checked"
       ":choices" "clear" "clip" "clip-path" "color" "columns" "column-count" "column-fill"
       "column-gap" "column-rule" "column-rule-color" "column-rule-style" "column-rule-width"
       "column-span" "column-width" "content" "counter-increment" "counter-reset" "cross-fade"
       "cubic-bezier" "cursor" "cycle" ":default" ":dir" "direction" ":disabled" "display" "@document"
       "element" ":empty" "empty-cells" ":enabled" "filter" ":first" ":first-child" ":first-letter"
       ":first-line" ":first-of-type" "flex" "flex-basis" "flex-direction" "flex-flow" "flex-grow"
       "flex-shrink" "flex-wrap" "float" ":focus" "font" "@font-face" "font-family"
       "font-feature-settings" "font-kerning" "font-language-override" "font-size" "font-size-adjust"
       "font-stretch" "font-style" "font-variant" "font-variant-ligatures" "font-weight" "height"
       ":hover" "hsl" "hsla" "hyphens" "icon" "image" "image-rendering" "image-resolution"
       "image-orientation" "ime-mode" "@import" ":indeterminate" ":in-range" "inherit" "initial"
       ":invalid" "justify-content" "@keyframes" ":lang" ":last-child" ":last-of-type" "left" ":left"
       "letter-spacing" "linear-gradient" ":link" "line-height" "list-style" "list-style-image"
       "list-style-position" "list-style-type" "margin" "margin-bottom" "margin-left" "margin-right"
       "margin-top" "marks" "mask" "matrix" "matrix3d" "max-height" "max-width" "@media" "min-height"
       "min-width" "nav-down" "nav-index" "nav-left" "nav-right" "nav-up" "none" "normal" ":not"
       ":nth-child" ":nth-last-child" ":nth-last-of-type" ":nth-of-type" "object-fit"
       "object-position" ":only-child" ":only-of-type" "opacity" ":optional" "order" "orphans"
       "outline" "outline-color" "outline-offset" "outline-style" "outline-width" ":out-of-range"
       "overflow" "overflow-wrap" "overflow-x" "overflow-y" "padding" "padding-bottom" "padding-left"
       "padding-right" "padding-top" "@page" "page-break-after" "page-break-before"
       "page-break-inside" "perspective" "perspective" "perspective-origin" "pointer-events"
       "position" "quotes" "radial-gradient" ":read-only" ":read-write" "rect" "::repeat-index"
       "::repeat-item" "repeating-linear-gradient" "repeating-radial-gradient" ":required" "resize"
       "rgb" "rgba" "right" ":right" "rotate" "rotateX" "rotateY" "rotateZ" "rotate3d" "scale"
       "scaleX" "scaleY" "scaleZ" "scale3d" ":scope" "::selection" "skew" "skewX" "skewY" "steps"
       "@supports" "table-layout" "tab-size" ":target" "text-align" "text-align-last"
       "text-combine-horizontal" "text-decoration" "text-decoration-color" "text-decoration-line"
       "text-decoration-style" "text-indent" "text-orientation" "text-overflow" "text-rendering"
       "text-shadow" "text-transform" "text-underline-position" "top" "transform"
       "transform-origin" "transform-style" "transition" "transition-delay" "transition-duration"
       "transition-property" "transition-timing-function" "translate" "translateX" "translateY"
       "translateZ" "translate3d" "url" ":valid" "::value" "vertical-align" "@viewport" "visibility"
       ":visited" "white-space" "widows" "width" "word-break" "word-spacing" "word-wrap"
       "writing-mode" "z-index" "-webkit-align-content" "-webkit-align-items" "-webkit-align-self"
       "-webkit-animation" "-webkit-animation-delay" "-webkit-animation-direction"
       "-webkit-animation-duration" "-webkit-animation-fill-mode" "-webkit-animation-iteration-count"
       "-webkit-animation-name" "-webkit-animation-play-state" "-webkit-animation-timing-function"
       "-webkit-app-region" "-webkit-appearance" "-webkit-aspect-ratio" "-webkit-backface-visibility"
       "-webkit-background-blend-mode" "-webkit-background-clip" "-webkit-background-composite"
       "-webkit-background-origin" "-webkit-background-size" "-webkit-blend-mode"
       "-webkit-border-after" "-webkit-border-after-color" "-webkit-border-after-style"
       "-webkit-border-after-width" "-webkit-border-before" "-webkit-border-before-color"
       "-webkit-border-before-style" "-webkit-border-before-width" "-webkit-border-bottom-left-radius"
       "-webkit-border-bottom-right-radius" "-webkit-border-end" "-webkit-border-end-color"
       "-webkit-border-end-style" "-webkit-border-end-width" "-webkit-border-fit"
       "-webkit-border-horizontal-spacing" "-webkit-border-image" "-webkit-border-radius"
       "-webkit-border-start" "-webkit-border-start-color" "-webkit-border-start-style"
       "-webkit-border-start-width" "-webkit-border-top-left-radius"
       "-webkit-border-top-right-radius" "-webkit-border-vertical-spacing" "-webkit-box-align"
       "-webkit-box-decoration-break" "-webkit-box-direction" "-webkit-box-flex"
       "-webkit-box-flex-group" "-webkit-box-lines" "-webkit-box-ordinal-group" "-webkit-box-orient"
       "-webkit-box-pack" "-webkit-box-reflect" "-webkit-box-shadow" "-webkit-box-sizing"
       "-webkit-clip-path" "-webkit-color-correction" "-webkit-column-axis"
       "-webkit-column-break-after" "-webkit-column-break-before" "-webkit-column-break-inside"
       "-webkit-column-count" "-webkit-column-gap" "-webkit-column-progression" "-webkit-column-rule"
       "-webkit-column-rule-color" "-webkit-column-rule-style" "-webkit-column-rule-width"
       "-webkit-column-span" "-webkit-column-width" "-webkit-columns" "-webkit-cursor-visibility"
       "-webkit-dashboard-region" "-webkit-filter" "-webkit-flex" "-webkit-flex-basis"
       "-webkit-flex-direction" "-webkit-flex-flow" "-webkit-flex-grow" "-webkit-flex-shrink"
       "-webkit-flex-wrap" "-webkit-flow-from" "-webkit-flow-into" "-webkit-font-feature-settings"
       "-webkit-font-kerning" "-webkit-font-size-delta" "-webkit-font-smoothing"
       "-webkit-font-variant-ligatures" "-webkit-grid-after" "-webkit-grid-auto-columns"
       "-webkit-grid-auto-flow" "-webkit-grid-auto-rows" "-webkit-grid-before" "-webkit-grid-column"
       "-webkit-grid-columns" "-webkit-grid-end" "-webkit-grid-row" "-webkit-grid-rows"
       "-webkit-grid-start" "-webkit-highlight" "-webkit-hyphenate-character"
       "-webkit-hyphenate-limit-after" "-webkit-hyphenate-limit-before" "-webkit-hyphenate-limit-lines"
       "-webkit-justify-content" "-webkit-line-align" "-webkit-line-box-contain" "-webkit-line-break"
       "-webkit-line-clamp" "-webkit-line-grid" "-webkit-line-snap" "-webkit-locale"
       "-webkit-logical-height" "-webkit-logical-width" "-webkit-margin-after"
       "-webkit-margin-after-collapse" "-webkit-margin-before" "-webkit-margin-before-collapse"
       "-webkit-margin-bottom-collapse" "-webkit-margin-collapse" "-webkit-margin-end"
       "-webkit-margin-start" "-webkit-margin-top-collapse" "-webkit-marquee"
       "-webkit-marquee-direction" "-webkit-marquee-increment" "-webkit-marquee-repetition"
       "-webkit-marquee-speed" "-webkit-marquee-style" "-webkit-mask" "-webkit-mask-box-image"
       "-webkit-mask-box-image-outset" "-webkit-mask-box-image-repeat"
       "-webkit-mask-box-image-slice" "-webkit-mask-box-image-source" "-webkit-mask-box-image-width"
       "-webkit-mask-clip" "-webkit-mask-composite" "-webkit-mask-image" "-webkit-mask-origin"
       "-webkit-mask-position" "-webkit-mask-position-x" "-webkit-mask-position-y"
       "-webkit-mask-repeat" "-webkit-mask-repeat-x" "-webkit-mask-repeat-y" "-webkit-mask-size"
       "-webkit-max-logical-height" "-webkit-max-logical-width" "-webkit-min-logical-height"
       "-webkit-min-logical-width" "-webkit-nbsp-mode" "-webkit-opacity" "-webkit-order"
       "-webkit-overflow-scrolling" "-webkit-padding-after" "-webkit-padding-before"
       "-webkit-padding-end" "-webkit-padding-start" "-webkit-perspective"
       "-webkit-perspective-origin" "-webkit-perspective-origin-x" "-webkit-perspective-origin-y"
       "-webkit-print-color-adjust" "-webkit-region-break-after" "-webkit-region-break-before"
       "-webkit-region-break-inside" "-webkit-region-overflow" "-webkit-rtl-ordering"
       "-webkit-ruby-position" "-webkit-shape-inside" "-webkit-shape-margin" "-webkit-shape-outside"
       "-webkit-shape-padding" "-webkit-svg-shadow" "-webkit-tap-highlight-color"
       "-webkit-text-align-last" "-webkit-text-decoration-color" "-webkit-text-decoration-line"
       "-webkit-text-decoration-style" "-webkit-text-decorations-in-effect"
       "-webkit-text-emphasis-position" "-webkit-text-fill-color" "-webkit-text-security"
       "-webkit-text-stroke" "-webkit-text-stroke-color" "-webkit-text-stroke-width"
       "-webkit-text-underline-position" "-webkit-touch-callout" "-webkit-transform"
       "-webkit-transform-origin" "-webkit-transform-origin-x" "-webkit-transform-origin-y"
       "-webkit-transform-origin-z" "-webkit-transform-style" "-webkit-transition"
       "-webkit-transition-delay" "-webkit-transition-duration" "-webkit-transition-property"
       "-webkit-transition-timing-function" "-webkit-user-drag" "-webkit-user-modify"
       "-webkit-user-select" "-webkit-wrap" "-webkit-wrap-flow" "-webkit-wrap-through"))

(defun try-expand-css (old)
  (let ((he-string-list css-reference-list))
    (try-expand-from-string-in-list old)))

(eval-after-load 'css-mode
  '(progn
     (define-key css-mode-map (kbd "s-:") 'pad-colon-and-maybe-semicolon)
     (set (make-local-variable 'hippie-expand-try-functions-list) hippie-expand-try-functions-list)
     (add-to-list 'hippie-expand-try-functions-list 'try-expand-css)
     ))

(eval-after-load 'stylus-mode
  '(progn
     (define-key stylus-mode-map (kbd "M-RET") 'newline)
     (set (make-local-variable 'hippie-expand-try-functions-list) hippie-expand-try-functions-list)
     (add-to-list 'hippie-expand-try-functions-list 'try-expand-css)
     ))

(provide 'hemacs-stylesheets)
