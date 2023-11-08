;;; -*- lexical-binding: t; -*-

;;; Xenodium

(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)

  ;;default mode-line-format
  ;;    '(" "
  ;;      mode-line-front-space
  ;;      mode-line-client
  ;;      mode-line-frame-identification
  ;;      mode-line-buffer-identification " " mode-line-position
  ;;      (vc-mode vc-mode)
  ;;      (multiple-cursors-mode mc/mode-line)
  ;;      " " mode-line-modes
  ;;      mode-line-end-spaces))

  (use-package minions
    :ensure t
    :custom
    (minions-mode-line-lighter "…")
    (minions-mode-line-delimiters '("" . ""))
    :config
    (minions-mode +1))

  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package nyan-mode
  :ensure t
  :defer 20
  :if (display-graphic-p)
  :custom
  (nyan-bar-length 10)
  :config
  (nyan-mode +1))

(use-package menu-bar
  ;; No need to confirm killing buffers.
  :bind ("C-x k" . kill-this-buffer))

;; Partially use path in buffer name.
(use-package uniquify
  :custom
  (uniquify-buffer-name-style 'forward))


;;; Emacs Bedrock

;; Mode line information
(setq line-number-mode t)                        ; Show current line in modeline
(setq column-number-mode t)                      ; Show column as well
