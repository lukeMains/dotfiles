;;; init-git.el --- Git SCM support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Git Blame
(use-package git-blamed
  :ensure t)

;; Like code lens for vs-code
(use-package blamer
  :ensure t
  :bind (("s-i" . blamer-show-commit-info)
         ("C-c i" . blamer-show-posframe-commit-info))
  :defer 20
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :height 110 ;; TODO: make this match custom font size
                    :italic t)))
  :config
  (global-blamer-mode 1))

;; Major modes for .gitignore, .gitconfig, etc. files
(use-package git-modes
  :ensure t)


(provide 'init-git)
;;; init-git.el ends here
