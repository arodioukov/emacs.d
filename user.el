;;
;; user customizations go here
;;

(custom-set-variables
 '(org-export-backends (quote (ascii html icalendar md))))

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Add the local git path for magit support on OSX
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (push "/usr/local/bin/git" exec-path)
  (push "/usr/local/bin" exec-path))

;; look & feel
(require 'smooth-scrolling)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; please stfu
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)

(set-face-attribute 'default nil :family "Menlo" :height 140)
(setq initial-frame-alist '((top . 3) (left . 3) (width . 220) (height . 64)))

(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night t)

;(load-theme 'monokai t)
;(load-theme 'solarized-dark t)
;; make the fringe stand out from the background
;(setq solarized-distinct-fringe-background t)
;; make the modeline high contrast
;(setq solarized-high-contrast-mode-line t)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; python
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq tab-width 4)
                      ())))

;; clojure
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

;; cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; ac-nrepl
(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

(eval-after-load "cider"
  '(define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; linum+
;(global-linum-mode 1)
(setq linum-eager nil)
(global-set-key (kbd "<f6>") 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

;; clj-refactor
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))
(cljr-add-keybindings-with-prefix "C-c C-m")

;; powerline
(require 'powerline)
(powerline-default-theme)
