(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

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
                      coffee-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load "~/.emacs.d/user.el")
