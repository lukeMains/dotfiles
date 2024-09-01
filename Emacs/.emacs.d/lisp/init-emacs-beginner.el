;;; init-emacs-beginner.el --- TODO: Description -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; Use y/n instead of yes/no confirms.
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Packages:
;; Explain emacs keybindings
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Better *help* buffer
(use-package helpful
  :ensure t
  :bind (("C-h f" . #'helpful-callable)
         ("C-h v" . #'helpful-variable)
         ("C-h k" . #'helpful-key)
         ("C-h x" . #'helpul-command)
         ;; Lookup the current symbol at point. C-c C-d is a common keybinding
         ;; for this in lisp modes.
         ("C-c C-d" . #'helpful-at-point)
         ;; Look up *F*unctions (excludes macros).
         ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
         ;; already links to the manual, if a function is referenced there.
         ("C-h F" . #'helpful-function)))

;; Info Updates
(use-package info-colors
  :ensure t
  :hook (Info-selection . info-colors-fontify-node))

(add-to-list 'Info-directory-list '"~/.local/share/info" t)

(provide 'init-emacs-beginner)
;;; init-emacs-beginner.el ends here
