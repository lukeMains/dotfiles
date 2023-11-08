;;; https://git.sr.ht/~ashton314/emacs-bedrock/
(setq gc-cons-threshold 10000000)
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))

;;; https://github.com/xenodium/dotsies/blob/main/emacs/early-init.el
;; No scrollbar by default.
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; No menubar by default.
;(when (fboundp 'menu-bar-mode)
;  (menu-bar-mode -1))

;; No toolbar by default.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; No tooltip by default.
(when (fboundp 'tooltip-mode)
  (tooltip-mode -1))

;; No Alarms by default.
(setq ring-bell-function 'ignore)

(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)
