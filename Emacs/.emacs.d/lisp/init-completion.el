;;; init-completion.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;;   Code for minibuffer and completion.
;;; Code:
(setq tab-always-indent 'complete)
(setq completion-category-defaults nil
      completion-category-overrides nil)
(setq completion-cycle-threshold 4)


;;; Packages:
;; Popup completion-at-point
(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  (setq-default corfu-auto t)
  (with-eval-after-load 'eshell
    (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))
  (setq-default corfu-quit-no-match 'separator)
  (corfu-popupinfo-mode))

(use-package corfu-terminal
  :ensure t
  :after corfu
  :config
  (corfu-terminal-mode))


;; Orderless: powerful completion style
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)))

(provide 'init-completion)
;;; init-completion.el ends here
