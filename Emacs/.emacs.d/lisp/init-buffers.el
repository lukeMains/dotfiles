;;; init-buffers.el --- TODO: Description -*- lexical-binding: t -*-
;;; Commentary:

;; No need to confirm killing buffers.
(use-package menu-bar
  :bind ("C-x k" . kill-this-buffer))

;; Partially use path in buffer name.
(use-package uniquify
  :custom
  (uniquify-buffer-name-style 'forward))

(provide 'init-buffers)
;;; End of init-buffers.el
