(when (eq system-type 'darwin)
	(define-key global-map (kbd "s-x") (cons "other command" #'execute-extended-command))
	; TODO when in visual mode, "s-v" should delete then paste

	(use-package ns-auto-titlebar
		:ensure t
		:demand t
		:config
			(ns-auto-titlebar-mode 1))
)
