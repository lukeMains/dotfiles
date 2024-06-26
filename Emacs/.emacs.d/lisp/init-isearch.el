;;; init-isearch.el --- isearch settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(with-eval-after-load 'isearch
  ;; DEL during isearch should edit the search string, not jump back to the previous result
  (define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

  ;; Activate occur easily inside isearch
  (when (fboundp 'isearch-occur)
    ;; to match ivy conventions
    (define-key isearch-mode-map (kbd "C-c C-o") 'isearch-occur)))

;;; Packages:

(use-package anzu
  :ensure t
  :hook (after-init . global-anzu-mode)
  :config
  (setq anzu-mode-lighter "")
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace))

(provide 'init-isearch)
;;; init-isearch.el ends here
