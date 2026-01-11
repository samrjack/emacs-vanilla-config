;;; themes.el --- Color themes -*- lexical-binding: t; -*-

;; Color schemes
(use-package dracula-theme
	:ensure t
	:defer t)

(use-package gruvbox-theme
	:ensure t
	:defer t)

(use-package afternoon-theme
	:ensure t
	:defer t)

(load-theme 'leuven-dark t)
