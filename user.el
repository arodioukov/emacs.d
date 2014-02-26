;;
;; user customizations go here
;;

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))


;; look & feel
(require 'smooth-scrolling)

;; please stfu
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)

(set-face-attribute 'default nil :family "Inconsolata" :height 160)
(setq initial-frame-alist '((top . 0) (left . 0) (width . 160) (height . 50)))

(load-theme 'monokai t)


;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)


;; python
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq tab-width 4))))


;; clojure
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

;; cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)

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

;; linum
(global-linum-mode 1)
