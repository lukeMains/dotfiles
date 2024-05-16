;;; init-whitespace.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:
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

(provide 'init-whitespace)
;;; init-whitespace.el ends here
