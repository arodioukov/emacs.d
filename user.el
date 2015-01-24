;;
;; user customizations go here
;;

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

;; look & feel (the rest is in theme.el)
(require 'smooth-scrolling)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(setq-default fill-column 80)

;; please stfu
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)


;; company
(add-hook 'after-init-hook 'global-company-mode)

;;
;; python
;;
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq tab-width 4)
                      ())))
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;;
;; clojure
;;
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

;; cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq cider-prefer-local-resources t)
(setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-wrap-history t)
(setq nrepl-buffer-name-show-port t)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(defun cider-eval-expression-at-point-in-repl ()
  (interactive)
  (let ((form (cider-defun-at-point)))
    ;; Strip excess whitespace
    (while (string-match "\\`\s+\\|\n+\\'" form)
      (setq form (replace-match "" t t form)))
    (set-buffer (cider-find-or-create-repl-buffer))
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)))

(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-`")
     'cider-eval-expression-at-point-in-repl))

;; clj-refactor
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))
(cljr-add-keybindings-with-prefix "C-c C-m")

;; linum+
(custom-set-variables '(linum-format 'dynamic))

(setq linum-eager nil)
(global-set-key (kbd "<f6>") 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

;; fci
(require 'fill-column-indicator)
(global-set-key (kbd "<f7>") 'fci-mode)

;; highlight-symbol
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
