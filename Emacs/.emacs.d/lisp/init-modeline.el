;;; init-modeline.el --- TODO: Description -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Mode line information
(setq line-number-mode t)                        ; Show current line in modeline
(setq column-number-mode t)                      ; Show column as well


;;; Packages

;; Prettier mode line with slanted lines to separate file name.
;; (use-package moody
;;   :ensure t
;;   :config
;;   (setq x-underline-at-descent-line t)
;;   (moody-replace-mode-line-buffer-identification)
;;   (moody-replace-vc-mode))

;; Replace list of minor modes with clickable '...'
(use-package minions
   :ensure t
   :custom
   (minions-mode-line-lighter "…")
   (minions-mode-line-delimiters '("" . ""))
   :config
   (minions-mode +1))

;; Nyan-Cat shows where you are in the buffer.
(use-package nyan-mode
  :ensure t
  :defer 20
  :if (display-graphic-p)
  :custom
  (nyan-bar-length 10)
  :config
  (nyan-mode +1))

(provide 'init-modeline)
;;; init-modeline.el ends here
