;;; init-dashboard.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:
(use-package page-break-lines
  :ensure t
  :config
  (page-break-lines-mode))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((recents . 5)
              (projects . 5)
              (agenda . 5)))
  (setq dashboard-projects-backend 'project-el)
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)
;;; init-dashboard.el ends here
