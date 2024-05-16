;;; init-themes.el --- TODO: Description -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; Packages:

(use-package zenburn-theme
  :ensure t
  :config
  ;(zenburn-with-color-variables
  ; (custom-theme-set-variables 'zenburn))
  ;; use variable-pitch fonts for some headings and titles
  (setq zenburn-use-variable-pitch t)

  ;; scale headings in org-mode
  (setq zenburn-scale-org-headlines t)

  ;; scale headings in outline-mode
  (setq zenburn-scale-outline-headlines t)

  ;;(load-theme 'zenburn t)
  )

(use-package autothemer
  :ensure t)

(use-package gruvbox-theme
  :ensure t
  :after (autothemer))

(use-package color-theme-sanityinc-tomorrow
  :ensure t)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
(setq custom-safe-themes t)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(sanityinc-tomorrow-bright))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

;; Toggle between light and dark

(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-day))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-bright))
  (reapply-themes))

(use-package dimmer
  :ensure t
  :config
  (dimmer-mode)
  (setq-default dimmer-fraction 0.15)

  ;; TODO: file upstream as a PR
  (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all)))

  ;; Don't dim in terminal windows. Even with 256 colours it can
  ;; lead to poor contrast.  Better would be to vary dimmer-fraction
  ;; according to frame type.
  (defun sanityinc/display-non-graphic-p ()
    (not (display-graphic-p)))
  (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p))

(provide 'init-themes)
;;; init-themes.el ends here
