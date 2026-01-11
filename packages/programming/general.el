;;; general.el --- General programming settings -*- lexical-binding: t; -*-

(use-package emacs
	:ensure nil
	:hook (prog-mode . display-line-numbers-mode))
(use-package emacs
	:ensure nil
	:after toggle-leader-keymapping
	:config
		(define-key toggle-leader-keymap (kbd "n") (cons "line numbers" #'display-line-numbers-mode)))
