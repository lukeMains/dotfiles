;;; init-magit.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:
(use-package async
  :ensure t)
(use-package dash
  :ensure t)
(use-package f
  :ensure t)
(use-package hl-todo :ensure t
  :hook ((prog-mode . hl-todo-mode)));; Highlight TODO, FIXME....
(use-package pcre2el
  :ensure t)
(use-package s
  :ensure t)

;; Magit
(use-package magit
  :ensure t
  :bind (("s-g" . magit-status))
  :config
  (setq-default magit-dif\f-refine-hunk 'all)
  (define-key magit-status-mode-map (kbd "C-M-<up>") 'magit-section-up))

;; Magit-todos
(use-package magit-todos
  :ensure t
  :config
  (magit-todos-mode))

(use-package fullframe
  :ensure t
  :config
  (fullframe magit-status magit-mode-quit-window))

(provide 'init-magit)
;;; init-magit.el ends here
