;;; init-lisp.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Enable desired features for all lisp modes

(defun sanityinc/enable-check-parens-on-save ()
  "Run `check-parens' when the current buffer is saved."
  (add-hook 'after-save-hook #'check-parens nil t))

(defvar sanityinc/lispy-modes-hook
  '(
    ;enable-paredit-mode
    sanityinc/enable-check-parens-on-save)
  "Hook run in all Lisp modes.")


(use-package aggressive-indent
  :ensure t
  :config
  (add-to-list 'sanityinc/lispy-modes-hook 'aggressive-indent-mode))

(defun sanityinc/lisp-setup ()
  "Enable features useful in any Lisp mode."
  (run-hooks 'sanityinc/lispy-modes-hook))

(require 'derived)

(dolist (mode '(emacs-lisp-mode ielm-mode lisp-mode inferior-lisp-mode lisp-interaction-mode))
  (add-hook (derived-mode-hook-name mode) 'sanityinc/lisp-setup))

(when (boundp 'eval-expression-minibuffer-setup-hook)
  (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode))

;; A quick way to jump to the definition of a function given its key binding
(global-set-key (kbd "C-h K") 'find-function-on-key)

(provide 'init-lisp)
;;; init-lisp.el ends here
