;;; -*- lexical-binding: t; -*-

;;; Xenodium + Ivan Malison

(use-package whitespace
  :ensure t
  :hook ((before-save . whitespace-cleanup)
     (prog-mode . imalison:show-trailing-whitespace)
     (text-mode . imalison:show-trailing-whitespace))
  :custom
  ;; When nil, fill-column is used instead.
  (whitespace-line-column nil)
  :config
  (defun imalison:show-trailing-whitespace ()
    "Show trailing whitespace."

    (interactive)
    (setq show-trailing-whitespace t)))

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

;;; Emacs Bedrock

(use-package eglot
  :ensure t

  ;; Configure hooks to automatically turn-on eglot for selected modes
  ; :hook ((python-mode . eglot))

  :custom
  (eglot-send-changes-idle-time 0.1)

  :config
  ;; Sometimes you need to tell Eglot where to find the language server
  ; (add-to-list 'eglot-server-programs
  ;              '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
  )

;;; Adam Porter / Ivan Malison
(setq-default fill-column 80)
(setq-default fci-rult-color "red")
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

;;; Customizations

;; hideshowvis - add little +/- displays to foldable regions in hs-minor-mode
;(use-package hideshowvis
;  ; ~/.emacs.d/modules/hideshowvis.el
;  :load-path "modules"
;  :config
;  (autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
;
;  (autoload 'hideshowvis-minor-mode
;    "hideshowvis"
;    "Will indicate regions foldable with hideshow in the fringe."
;    'interactive)
;
;  (dolist (hook (list 'emacs-lisp-mode-hook
;                      'c-mode-hook
;                      'c++-mode-hook
;                      'rust-mode-hook
;                      'html-mode-hook
;                      'css-mode-hook
;                      'javascript-mode
;                      'python-mode))
;    (add-hook hook 'hideshowvis-enable))
;
;  (hideshowvis-symbols))

;; Auto type closing pair for '(', '{', '<', ..., etc.
(use-package prog-mode
  :hook ('prog-mode . 'electric-pair-mode))

;; Use spaces for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;; Magit + Magit TODOs

(use-package async
  :ensure t)
(use-package dash
  :ensure t)
(use-package f
  :ensure t)
(use-package hl-todo :ensure t
  :hook ((prog-mode . hl-todo-mode)));; Highlight TODO, FIXME....
(use-package pcre2el
  :ensure t)
(use-package s
  :ensure t)

;; Magit
(use-package magit
  :ensure t
  :bind (("s-g" . magit-status)))

;; Magit-todos
(use-package magit-todos
  :ensure t
  :config
  (magit-todos-mode))

;;; Text and Configuration Files

(use-package markdown-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package toml-mode
  :ensure t)

;;; Programming

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :custom
  (python-indent-guess-indent-offset-verbose nil))

(use-package rust-mode
  :ensure t)
