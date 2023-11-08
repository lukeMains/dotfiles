;;; -*- lexical-binding: t; -*-

;;; Emacs Bedrock

;; Minibuffer/completion settings
(setq completion-cycle-threshold 1)                  ; TAB cycles candidates
(setq completions-detailed t)                        ; Show annotations
(setq tab-always-indent 'complete)                   ; When I hit TAB, try to complete, otherwise, indent
(setq completion-auto-help 'always)                  ; Open completion always; `lazy' another option

;; Misc. UI tweaks
(blink-cursor-mode -1)                               ; Steady cursor
(setq-default cursor-type 'bar)

;; Minibuffer and completion

;; Vertico: better vertical completion for minibuffer commands
(use-package vertico
  :ensure t
  :init
  (fido-mode -1)
  (vertico-mode))

;; Marginalia: annotations for minibuffer
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; Popup completion-at-point
(use-package corfu
  :ensure t
  :config
  (global-corfu-mode))

;; Orderless: powerful completion style
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))

;; Consult: Misc. enhanced commands
(use-package consult
  :ensure t
  ;; Other good things to bind: consult-ripgrep, consult-line-multi,
  ;; consult-history, consult-outline, consult-error
  :bind (("C-x b" . consult-buffer) ;; orig. switch-to-buffer
         ("C-c M-y" . consult-yank-pop)
         ("C-c C-s" . consult-line)))

;;; Customizations

;; Always display line numbers
(global-display-line-numbers-mode)

;; Truncate long lines by default
(setq-default truncate-lines t)

;; Theme
(use-package zenburn-theme
  :ensure t
  :config
  ;(zenburn-with-color-variables
  ; (custom-theme-set-variables 'zenburn
  ;                            `(fci-rule-color ,zenburn-cyan)))
  ;; use variable-pitch fonts for some headings and titles
  (setq zenburn-use-variable-pitch t)

  ;; scale headings in org-mode
  (setq zenburn-scale-org-headlines t)

  ;; scale headings in outline-mode
  (setq zenburn-scale-outline-headlines t)

  (load-theme 'zenburn t))

;; Emacs Dashboard
(use-package page-break-lines
  :ensure t
  :config
  (page-break-lines-mode))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((recents . 5)
              (projects . 5)
              (agenda . 5)))
  (setq dashboard-projects-backend 'project-el)
  (dashboard-setup-startup-hook))

;; Better *help* buffer
(use-package helpful
  :ensure t
  :bind (("C-h f" . #'helpful-callable)
         ("C-h v" . #'helpful-variable)
         ("C-h k" . #'helpful-key)
         ("C-h x" . #'helpul-command)
         ;; Lookup the current symbol at point. C-c C-d is a common keybinding
         ;; for this in lisp modes.
         ("C-c C-d" . #'helpful-at-point)
         ;; Look up *F*unctions (excludes macros).
         ;;
         ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
         ;; already links to the manual, if a function is referenced there.
         ("C-h F" . #'helpful-function)))

;; Ligatures
(use-package ligature
  ; ~/.emacs.d/modules/ligature.el
  :load-path "modules"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia and Fira Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode
                        '(;; == === ==== => =| =>>=>=|=>==>> ==< =/=//=// =~
                          ;; =:= =!=
                          ("=" (rx (+ (or ">" "<" "|" "/" "~" ":" "!" "="))))
                          ;; ;; ;;;
                          (";" (rx (+ ";")))
                          ;; && &&&
                          ("&" (rx (+ "&")))
                          ;; !! !!! !. !: !!. != !== !~
                          ("!" (rx (+ (or "=" "!" "\." ":" "~"))))
                          ;; ?? ??? ?:  ?=  ?.
                          ("?" (rx (or ":" "=" "\." (+ "?"))))
                          ;; %% %%%
                          ("%" (rx (+ "%")))
                          ;; |> ||> |||> ||||> |] |} || ||| |-> ||-||
                          ;; |->>-||-<<-| |- |== ||=||
                          ;; |==>>==<<==<=>==//==/=!==:===>
                          ("|" (rx (+ (or ">" "<" "|" "/" ":" "!" "}" "\]"
                                          "-" "=" ))))
                          ;; \\ \\\ \/
                          ("\\" (rx (or "/" (+ "\\"))))
                          ;; ++ +++ ++++ +>
                          ("+" (rx (or ">" (+ "+"))))
                          ;; :: ::: :::: :> :< := :// ::=
                          (":" (rx (or ">" "<" "=" "//" ":=" (+ ":"))))
                          ;; // /// //// /\ /* /> /===:===!=//===>>==>==/
                          ("/" (rx (+ (or ">"  "<" "|" "/" "\\" "\*" ":" "!"
                                          "="))))
                          ;; .. ... .... .= .- .? ..= ..<
                          ("\." (rx (or "=" "-" "\?" "\.=" "\.<" (+ "\."))))
                          ;; -- --- ---- -~ -> ->> -| -|->-->>->--<<-|
                          ("-" (rx (+ (or ">" "<" "|" "~" "-"))))
                          ;; *> */ *)  ** *** ****
                          ("*" (rx (or ">" "/" ")" (+ "*"))))
                          ;; www wwww
                          ("w" (rx (+ "w")))
                          ;; <> <!-- <|> <: <~ <~> <~~ <+ <* <$ </  <+> <*>
                          ;; <$> </> <|  <||  <||| <|||| <- <-| <-<<-|-> <->>
                          ;; <<-> <= <=> <<==<<==>=|=>==/==//=!==:=>
                          ;; << <<< <<<<
                          ("<" (rx (+ (or "\+" "\*" "\$" "<" ">" ":" "~"  "!"
                                          "-"  "/" "|" "="))))
                          ;; >: >- >>- >--|-> >>-|-> >= >== >>== >=|=:=>>
                          ;; >> >>> >>>>
                          (">" (rx (+ (or ">" "<" "|" "/" ":" "=" "-"))))
                          ;; #: #= #! #( #? #[ #{ #_ #_( ## ### #####
                          ("#" (rx (or ":" "=" "!" "(" "\?" "\[" "{" "_(" "_"
                                       (+ "#"))))
                          ;; ~~ ~~~ ~=  ~-  ~@ ~> ~~>
                          ("~" (rx (or ">" "=" "-" "@" "~>" (+ "~"))))
                          ;; __ ___ ____ _|_ __|____|_
                          ("_" (rx (+ (or "_" "|"))))
                          ;; Fira code: 0xFF 0x12
                          ("0" (rx (and "x" (+ (in "A-F" "a-f" "0-9")))))
                          ;; Fira code:
                          "Fl"  "Tl"  "fi"  "fj"  "fl"  "ft"
                          ;; The few not covered by the regexps.
                          "{|"  "[|"  "]#"  "(*"  "}#"  "$>"  "^="))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))
