;;; undo.el --- Undo system -*- lexical-binding: t; -*-

(use-package undo-tree
	:ensure t
	:hook ((after-config . global-undo-tree-mode)
		   (evil-local-mode . turn-on-undo-tree-mode))
	:init
		(setq undo-tree-visualizer-timestamps t
			  undo-tree-visualizer-diff t
			  undo-limit 800000
			  undo-strong-limit 12000000
			  undo-outer-limit 120000000)
	:config
		(global-undo-tree-mode 1)
		(setq undo-dir (expand-file-name "undo" local-dir))
		(make-directory undo-dir t)
		(setq undo-tree-history-directory-alist (list (cons "."  undo-dir))))

(use-package emacs
	:ensure nil
	:after (undo-tree leader-keymapping)
	:config (define-key leader-keymap (kbd "u") (cons "undo tree" #'undo-tree-visualize)))
