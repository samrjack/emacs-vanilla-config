(use-package lisp-mode
	:ensure nil
	:custom (lisp-body-indent 4))

(use-package lisp-extra-font-lock
	:ensure t
	:hook (after-config . lisp-extra-font-lock-global-mode))

(use-package easy-escape
	:ensure t
	:hook (emacs-lisp-mode . easy-escape-minor-mode))
