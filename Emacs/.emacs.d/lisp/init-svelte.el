;;; TODO

(use-package svelte-mode
  :ensure t
  :after 'eglot
  :config
  (add-to-list 'eglot-server-programs
           '(svelte-mode . ("svelteserver" "--stdio"))))



(provide 'init-svelte)
;;; End of init-svelte.el
