(use-package rainbow-delimiters
	:ensure t
	:hook (prog-mode . rainbow-delimiters-mode))
(use-package evil
	:ensure nil
	:after (evil toggle-leader-keymapping)
	:config
		(define-key toggle-leader-keymap (kbd "r") (cons "rainbow delimiters" #'rainbow-delimiters-mode)))
