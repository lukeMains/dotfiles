;;; -*- lexical-binding: t; -*-

;;; Sources:
;;;   - Xenodium      - https://github.com/xenodium/
;;;   - Emacs Bedrock - https://git.sr.ht/~ashton314/emacs-bedrock/
;;;   - Sacha Chua    - https://github.com/sachac/.emacs.d
;;;   - Adam Porter/Ivan Malison - https://github.com/alphapapa/dotfiles


;;; Xenodium

;; https://github.com/hlissner/doom-emacs/blob/58af4aef56469f3f495129b4e7d947553f420fca/core/core.el#L194
(setq initial-major-mode 'fundamental-mode)

;; Allow access from emacsclient
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Set up package tls ;;;;

(require 'package)

;; Don't auto-initialize.
;(setq package-enable-at-startup nil)

;; Don't add that `custom-set-variables' block to init.
;(setq package--init-file-ensured t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages
   '(pcre2el async helpful magit-todos highlight-indent-guides page-break-lines dashboard whitespace zenburn-theme yaml-mode which-key vertico use-package toml-mode rust-mode rainbow-mode orderless nyan-mode moody minions markdown-mode marginalia magit json-mode hl-todo eglot corfu consult))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight regular :height 128 :width normal)))))

;; From https://irreal.org/blog/?p=8243
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; From https://github.com/hlissner/doom-emacs/blob/5dacbb7cb1c6ac246a9ccd15e6c4290def67757c/core/core-packages.el#L102
(setq gnutls-verify-error (not (getenv "INSECURE")) ; you shouldn't use this
      tls-checktrust gnutls-verify-error
      tls-program (list "gnutls-cli --x509cafile %t -p %p %h"
        ;; compatibility fallbacks
        "gnutls-cli -p %p %h"
        "openssl s_client -connect %h:%p -no_ssl2 -no_ssl3 -ign_eof"))

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")
    ("nongnu" . "https://elpa.nongnu.org/nongnu/")
    ("gnu" . "https://elpa.gnu.org/packages/")))

(setq package-archive-priorities
      '(("melpa" .  4)
    ("melpa-stable" . 3)
    ("org" . 2)
    ("gnu" . 1)))

;(when (< emacs-major-version 27)
;  (unless package--initialized
;    (package-initialize)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package-enable-imenu-support must be
;; set before requiring use-package.
(setq use-package-enable-imenu-support t)
(require 'use-package)

;; Remember history of things across launches (ie. kill ring).
;; From https://www.wisdomandwonder.com/wp-content/uploads/2014/03/C3F.html
(use-package savehist
  :defer 10
  :custom
  (savehist-file "~/.emacs.d/savehist")
  (savehist-save-minibuffer-history t)
  (history-length 20000)
  :config
  (savehist-mode +1))


;;; Emacs Bedrock

;; Don't litter file system with *~ backup files; put them all inside
;; ~/.emacs.d/backup or wherever
(defun bedrock--backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* ((backupRootDir "~/.emacs.d/emacs-backup/")
     (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path
     (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") )))
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath))
(setq make-backup-file-name-function 'bedrock--backup-file-name)

;;; Customizations

;; Use y/n instead of yes/no confirms.
;; From http://pages.sachachua.com/.emacs.d/Sacha.html#sec-1-4-8
(fset 'yes-or-no-p 'y-or-n-p)

;; explain emacs keybindings
(use-package which-key
  :ensure t)


;;; Load Custom Files
(load-file (concat user-emacs-directory "custom/ui.el"))
(load-file (concat user-emacs-directory "custom/modeline.el"))
(load-file (concat user-emacs-directory "custom/dev.el"))
;(load-file (concat user-emacs-directory "custom/..."))
