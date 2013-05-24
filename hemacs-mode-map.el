(dolist (regex '("\\.rake$" "\\.gemspec$" "\\.ru$" "Guardfile$" "Vagrantfile$"
                 "Rakefile$" "Gemfile$" "Capfile$" "Procfile$" "\\.rabl$"
                 "\\.gems$" "\\.feature$" "\\.builder$"))
  (add-to-list 'auto-mode-alist `(,regex . ruby-mode)))

;; file types
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(add-to-list 'auto-mode-alist '("\\.cfm" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hamlbars$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$" . html-mode))
;; (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . less-css-mode))

(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(provide 'hemacs-mode-map)
