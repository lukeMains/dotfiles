;;; init-dired.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default dired-dwim-target t)

;; Prefer g-prefixed coreutils version of standard utilities when available
(let ((gls (executable-find "gls")))
  (when gls (setq insert-directory-program gls)))

(with-eval-after-load 'dired
  (setq dired-recursive-deletes 'top)
  (define-key dired-mode-map [mouse-2] 'dired-find-file)
  (define-key dired-mode-map (kbd "C-c C-q") 'wdired-change-to-wdired-mode))

;;; Packages:
(use-package diredfl
  :ensure t
  :config
  (diredfl-global-mode)
  (require 'dired-x))

(use-package diff-hl
  :ensure t
  :hook (dired-mode . dired-diff-hl-mode))

(provide 'init-dired)
;;; init-dired.el ends here
