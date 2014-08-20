(require 'package)

(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(cider
                      clj-refactor
                      clojure-mode
                      clojure-mode-extra-font-locking
                      coffee-mode
                      company
                      fill-column-indicator
                      highlight-symbol
                      jedi
                      kibit-mode
                      markdown-mode
                      org
                      popup
                      powerline
                      python-mode
                      rainbow-delimiters
                      smartparens
                      smooth-scrolling
                      slamhound
                      starter-kit
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-lisp
                      starter-kit-ruby
                      yaml-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;(add-to-list 'load-path "~/.emacs.d/vendor/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))

(load "~/.emacs.d/theme.el")
(load "~/.emacs.d/user.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
