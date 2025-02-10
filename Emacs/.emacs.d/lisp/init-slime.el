;;; init-slime.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:

;; (use-package slime
;;   :ensure t
;;   :config
;;   (setq inferior-lisp-program "sbcl")
;;   (slime-setup '(slime-fancy)))

(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl")
  (with-eval-after-load 'sly
    (define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup)
    (setq sly-protocol-version 'ignore)
    (setq sly-net-coding-system 'utf-8-unix)
    (let ((features '(sly-fancy)))
      ;; (when (require 'sly-company nil t)
      ;;   (push 'sly-company features))
      (sly-setup features))))

(use-package sly-asdf
  :ensure t)

;; (use-package sly-macrostep
;;   :ensure t)

(use-package sly-repl-ansi-color
  :ensure t)

;;; REPL

(with-eval-after-load 'sly-repl
  ;; Stop SLY's REPL from grabbing DEL, which is annoying when backspacing over a '('
  ;; (with-eval-after-load 'paredit
  ;;   (define-key sly-repl-mode-map (read-kbd-macro paredit-backward-delete-key) nil))

  ;; Bind TAB to `indent-for-tab-command', as in regular Sly buffers.
  (define-key sly-repl-mode-map (kbd "TAB") 'indent-for-tab-command)

  (add-hook 'sly-repl-mode-hook 'sanityinc/lisp-setup))

(provide 'init-slime)
;;; init-slime.el ends here
