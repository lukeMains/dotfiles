;;; todo

;; hideshowvis - add little +/- displays to foldable regions in hs-minor-mode
;; (use-package hideshowvis
;;   ; ~/.emacs.d/site-lisp/hideshowvis.el
;;   :load-path "site-lisp"
;;   :config
;;   (autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

;;   (autoload 'hideshowvis-minor-mode
;;     "hideshowvis"
;;     "Will indicate regions foldable with hideshow in the fringe."
;;     'interactive)

;;   ;; (dolist (hook (list 'emacs-lisp-mode-hook
;;   ;;                     'c-mode-hook
;;   ;;                     'c++-mode-hook
;;   ;;                     'rust-mode-hook
;;   ;;                     'html-mode-hook
;;   ;;                     'css-mode-hook
;;   ;;                     'javascript-mode-hook
;;   ;;                     'python-mode-hook))
;;   ;;   (add-hook hook 'hideshowvis-enable))

;;   (hideshowvis-symbols))

;; Code Folding
(use-package origami
  ; ~/.emacs.d/site-lisp/origami.el/origami.el
  :load-path "site-lisp"
  :bind (("C-c k l" . origami-toggle-fold))
  :config
  (global-origami-mode t))

(provide 'init-code-folding)
;;; init-code-folding.el ends here
