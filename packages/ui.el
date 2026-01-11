;;; ui.el --- UI enhancements -*- lexical-binding: t; -*-

(use-package golden-ratio
	:ensure (:host github :repo "roman/golden-ratio.el")
	:defer t)
(use-package emacs
	:ensure nil
	:after toggle-leader-keymapping
	:config
		(define-key toggle-leader-keymap (kbd "g") (cons "golden-ratio mode" #'golden-ratio-mode)))
