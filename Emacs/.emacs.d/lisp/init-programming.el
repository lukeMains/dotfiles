;;; init-programming.el --- todo: desc -*- lexical-binding: t -*-

(use-package newcomment
  :bind (:map
     prog-mode-map
     ;; Better comment functionality
     ;; https://emacsredux.com/blog/2020/06/10/comment-commands-redux/
     ("M-;" . 'comment-line)
     ("C-M-;" . 'comment-line)))

;; Highlight hex strings in respective color.
(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-mode))

;; Show vertical line at column 80
(setq-default fill-column 80)
(setq-default display-fill-column-indicator t)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

;; Show tab indentations
(use-package highlight-indent-guides
  :ensure t
  ;:commands highlight-indent-guides-mode
  ;:preface
  ;(progn
  ;  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (progn
    (setq highlight-indent-guides-method 'character)))

;; Auto type closing pair for '(', '{', '<', ..., etc.
(use-package prog-mode
  :hook ('prog-mode . 'electric-pair-mode))

;; Use spaces for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Always enable eldoc mode
(when (fboundp 'global-eldoc-mode)
  (add-hook 'after-init-hook 'global-eldoc-mode))

;;; Text and Configuration Files

(use-package markdown-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package toml-mode
  :ensure t)

;;; Programming Language Specific

(require 'init-python)
(require 'init-rust)
(require 'init-go)
(require 'init-elisp)
(require 'init-lisp)
(require 'init-slime)
(require 'init-svelte)

(provide 'init-programming)
;;; init-programming.el ends here
