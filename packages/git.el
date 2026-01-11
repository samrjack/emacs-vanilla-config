;;; git.el --- Git integration -*- lexical-binding: t; -*-

(use-package magit
	:ensure t
	:defer t)
;; ; Allow working with github features from magit
;; (use-package forge
;; 	:ensure (:host github :repo "magit/forge")
;; 	:after magit)
;; ; Allow working with code reviews through forge plugin in magit
;; (use-package code-review
;; 	:ensure t
;; 	:after forge)
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

(use-package emacs
	:ensure nil
	:after (evil magit)
	:hook (git-commit-mode . evil-insert-state) ; Start commits in insert mode
	:config
		(evil-define-key 'normal magit-mode-map (kbd ".") (cons "show commit" #'magit-diff-show-or-scroll-up)))
