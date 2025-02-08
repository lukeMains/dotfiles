;;; init-ui.el --- TODO: desc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; Cursor
(blink-cursor-mode -1)                               ; Steady cursor
(setq-default cursor-type 'bar)

;; Show line numbers
(global-display-line-numbers-mode)
(setq-default display-line-numbers-width 3)

;; Truncate long lines by default
(setq-default truncate-lines t)

;; Smooth scrolling
(setq-default
 window-resize-pixelwise t
 frame-resize-pixelwise t)

(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode))

;; Remove tool bar icons from menu
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(when (sanityinc/display-non-graphic-p)
  (menu-bar-mode -1))

;;; Packages:
;; Change global font size easily
;; Use C-M-[- / =] to change default
(use-package default-text-scale
  :ensure t
  :hook (after-init . default-text-scale-mode))

(provide 'init-ui)
;;; init-ui.el ends here
