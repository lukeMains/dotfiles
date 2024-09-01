;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;;;   This file bootstraps the configuration, which is divided into
;;;   a number of other files.
;;;
;;;   Sources:
;;;     - Xenodium      - https://github.com/xenodium/
;;;     - Emacs Bedrock - https://git.sr.ht/~ashton314/emacs-bedrock/
;;;     - Sacha Chua    - https://github.com/sachac/.emacs.d/
;;;     - Adam Porter   - https://github.com/alphapapa/dotfiles/
;;;        - (Ivan Malison)
;;;     - Steve Purcell - https://github.com/purcell/.emacs.d/

;;; Code:
;; Save emacs customizations in ~/.emacs.d/custom.el
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Add ~/.emacs.d/lisp/ to `load-path`
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load files from ~/.emacs.d/lisp/ directory
(require 'init-site-lisp)
(require 'init-use-package)
(require 'init-backups)
(require 'init-emacs-beginner)
(require 'init-buffers)
(require 'init-modeline)
(require 'init-spell-checking)
(require 'init-themes)
;(require 'init-dashboard)
(require 'init-ligature)
(require 'init-minibuffer)
(require 'init-completion)
(require 'init-ui)
(require 'init-whitespace)
(require 'init-code-folding) ; TODO: add origami keybindings
(require 'init-programming) ; Loads each lisp/init-<lang>.el file.
(require 'init-magit)
(require 'init-vc)
(require 'init-git)
(require 'init-tree-sitter)
(require 'init-eglot)
(require 'init-ibuffer)
(require 'init-recentf)
(require 'init-dired)
(require 'init-isearch)
(require 'init-exec-path)
(require 'init-direnv)
(require 'init-editing-utils)
(require 'init-sound)
(require 'init-fish)
(require 'init-latex)

(provide 'init)
;;; init.el ends here
