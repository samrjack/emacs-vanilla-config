(use-package tree-sitter
	:ensure t
	:demand t
	:config
		(global-tree-sitter-mode 1)
		(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
	:ensure t)

(use-package treesit-auto
	:ensure t
	:demand t
	:custom
		(treesit-auto-install t)
	:config
		(treesit-auto-add-to-auto-mode-alist 'all)
		(global-treesit-auto-mode 1))
