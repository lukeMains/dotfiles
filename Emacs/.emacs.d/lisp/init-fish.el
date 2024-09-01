;;; TODO
(use-package fish-mode
  :ensure t
  :config
  (add-hook 'fish-mode-hook (lambda ()
                             (add-hook 'before-save-hook 'fish_indent-before-save))))



(provide 'init-fish)
;;; End of init-fish.el
