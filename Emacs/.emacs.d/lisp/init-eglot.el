;;; init-eglot.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:
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

  (setq read-process-output-max (* 1024 1024))
  )

(use-package consult-eglot
  :ensure t
  :after eglot)

(provide 'init-eglot)
;;; init-eglot.el ends here
