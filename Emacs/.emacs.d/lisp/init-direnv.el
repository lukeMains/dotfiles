;;; init-direnv.el --- Integrate with direnv -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package envrc
  :ensure t
  :config
  (defun sanityinc/maybe-enable-envrc-global-mode ()
    "Enable `envrc-global-mode' if `direnv' is installed."
    (when (executable-find "direnv")
      (envrc-global-mode)))

  (define-key envrc-mode-map (kbd "C-c e") 'envrc-command-map)
  (add-hook 'after-init-hook 'sanityinc/maybe-enable-envrc-global-mode))


(provide 'init-direnv)
;;; init-direnv.el ends here
