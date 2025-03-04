(use-package magit
	:ensure t
	:defer t)
; Allow working with github features from magit
(use-package forge
	:ensure t
	:after magit)
; Allow working with code reviews through forge plugin in magit
(use-package code-review
	:ensure t
	:after forge)
; Dependence for magit to work properly. Magit needs the most recent version to function.
(use-package transient
	:ensure t
	:defer t)

(use-package emacs
	:ensure nil
	:after (evil leader-keymapping)
	:init
		(setq git-leader-keymap (make-sparse-keymap))
	:config
		(define-key git-leader-keymap "g" (cons "magit" #'magit-status))
		(define-key leader-keymap "g" (cons "git" git-leader-keymap)))
