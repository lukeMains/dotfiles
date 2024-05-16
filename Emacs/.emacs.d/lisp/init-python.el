;;; init-python.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:
(use-package python
  :mode ("\\.py\\'" . python-ts-mode)
  :custom
  (python-indent-guess-indent-offset-verbose nil))

(use-package auto-virtualenv
  :ensure t
  :init
  (use-package pyvenv
    :ensure t)
  :config
  (add-hook 'python-mode-hook 'pyvenv-mode)
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  ;;(add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)  ;; If using projectile
  )

(provide 'init-python)
;;; init-python.el ends here
