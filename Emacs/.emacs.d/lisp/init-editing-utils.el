;;; init-editing-utils.el --- Day-to-day editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package unfill
  :ensure t)

;; Matching <> {} [] etc.. pairs
(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))
(add-hook 'after-init-hook 'electric-indent-mode)

;; Delete highlighted region instead of normal cursor delete
(add-hook 'after-init-hook 'delete-selection-mode)

;; Auto-revert files
(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;; TODO: desc
(add-hook 'after-init-hook 'transient-mark-mode)

;; Different color for layers of (), {}, etc...
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Highlight symbols and jump between them
(use-package symbol-overlay
  :ensure t
  :hook ((prog-mode html-mode yaml-mode conf-mode) . symbol-overlay-mode)
  :config
  (define-key symbol-overlay-mode-map (kbd "M-i") 'symbol-overlay-put)
  (define-key symbol-overlay-mode-map (kbd "M-I") 'symbol-overlay-remove-all)
  (define-key symbol-overlay-mode-map (kbd "M-n") 'symbol-overlay-jump-next)
  (define-key symbol-overlay-mode-map (kbd "M-p") 'symbol-overlay-jump-prev))

;; Multiple Cursors
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-+") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;;; Page break lines (^L)
;; NOTE: Use "C-q C-l" to insert a page break
(use-package page-break-lines
  :ensure t
  :hook (after-init . global-page-break-lines-mode))

;; Shift lines up and down with M-up and M-down. When paredit is enabled,
;; it will use those keybindings. For this reason, you might prefer to
;; use M-S-up and M-S-down, which will work even in lisp modes.
(use-package move-dup
  :ensure t
  :config
  ;; (global-set-key [M-up] 'move-dup-move-lines-up)
  ;; (global-set-key [M-down] 'move-dup-move-lines-down)
  (global-set-key [M-S-up] 'move-dup-move-lines-up)
  (global-set-key [M-S-down] 'move-dup-move-lines-down)

  (global-set-key (kbd "C-c d") 'move-dup-duplicate-down)
  (global-set-key (kbd "C-c u") 'move-dup-duplicate-up))

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
