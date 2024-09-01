;;; init-slime.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:

;; (use-package slime
;;   :ensure t
;;   :config
;;   (setq inferior-lisp-program "sbcl")
;;   (slime-setup '(slime-fancy)))

(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl")
  (eval-after-load 'sly
    `(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup))
)

(provide 'init-slime)
;;; init-slime.el ends here
