(use-package magit
	:ensure t
	:defer t)

(use-package transient
	:ensure t
	:defer t)

(use-package evil
	:ensure nil
	:after (evil leader-keymapping)
	:init
		(setq git-leader-keymap (make-sparse-keymap))
	:config
		(define-key git-leader-keymap "g" (cons "magit" #'magit-status))
		(define-key leader-keymap "g" (cons "git" git-leader-keymap)))
