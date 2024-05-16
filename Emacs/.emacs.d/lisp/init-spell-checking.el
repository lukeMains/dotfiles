;;; init-spell-checking.el --- TODO: Description -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:
(use-package jinx
  :ensure t
  ;;:hook (emacs-startup . global-jinx-mode)
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jinx-langauges)))

(use-package vertico-multiform
  :after vertico
  :ensure nil
  :config
  (add-to-list 'vertico-multiform-categories
               '(jinx grid (vertico-grid-annotate . 20)))
  (vertico-multiform-mode 1))

(provide 'init-spell-checking)
;;; init-spell-checking.el ends here
