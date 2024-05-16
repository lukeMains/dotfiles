;;; init-minibuffer.el --- TODO: description -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:

;; Vertico: better vertical completion for minibuffer commands
(use-package vertico
  :ensure t
  :config
  (vertico-mode))

;; Marginalia: annotations for minibuffer
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; Consult: Misc. enhanced commands
(use-package consult
  :ensure t
  ;; Other good things to bind: consult-ripgrep, consult-line-multi,
  ;; consult-history, consult-outline, consult-error
  :bind (("C-x b" . consult-buffer) ;; orig. switch-to-buffer
         ("C-c M-y" . consult-yank-pop)
         ("C-c C-s" . consult-line)
         ("C-c r" . consult-ripgrep)))


(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
