;;; init-git.el --- Git SCM support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Show changed lines for a file off to the side (green for added, red for
;; removed etc...)
(use-package diff-hl
  :ensure t)

;; Major modes for .gitignore, .gitconfig, etc. files
(use-package git-modes
  :ensure t)


(provide 'init-git)
;;; init-git.el ends here
