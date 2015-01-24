(require 'package)

(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(ag
                      cider
                      clj-refactor
                      clojure-mode
                      clojure-mode-extra-font-locking
                      company
                      fill-column-indicator
                      highlight-symbol
                      kibit-mode
                      markdown-mode
                      nav
                      org
                      python-mode
                      rainbow-delimiters
                      smooth-scrolling
		      solarized-theme
                      slamhound
                      starter-kit
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-lisp
                      yaml-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;(add-to-list 'load-path "~/.emacs.d/vendor/")

(load "~/.emacs.d/theme.el")
(load "~/.emacs.d/user.el")

