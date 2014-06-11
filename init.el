(require 'package)

(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-ruby
                      starter-kit-js
                      starter-kit-eshell
                      clojure-mode
                      clojure-test-mode
                      cider
                      auto-complete
                      popup
                      fuzzy
                      ac-nrepl
                      highlight
                      smooth-scrolling
                      markdown-mode
                      yaml-mode
                      rainbow-delimiters
                      auto-complete
                      ac-nrepl
                      solarized-theme
                      monokai-theme
                      python-mode
                      clj-refactor
                      powerline
                      org
                      coffee-mode
                      jedi
                      flycheck
                      autopair
                      fill-column-indicator))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;(add-to-list 'load-path "~/.emacs.d/vendor/")

(load "~/.emacs.d/user.el")

