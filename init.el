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

(load "~/.emacs.d/theme.el")
(load "~/.emacs.d/user.el")
