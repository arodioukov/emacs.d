(require 'package)

(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(ac-nrepl
                      ac-nrepl
                      auto-complete
                      auto-complete
                      autopair
                      cider
                      clj-refactor
                      clojure-mode
                      clojure-test-mode
                      coffee-mode
                      fill-column-indicator
                      flycheck
                      fuzzy
                      highlight
                      highlight-symbol
                      jedi
                      markdown-mode
                      monokai-theme
                      org
                      popup
                      powerline
                      python-mode
                      rainbow-delimiters
                      smooth-scrolling
                      solarized-theme
                      starter-kit
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-lisp
                      starter-kit-ruby
                      yaml-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;(add-to-list 'load-path "~/.emacs.d/vendor/")

(load "~/.emacs.d/user.el")
