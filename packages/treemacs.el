;;; treemacs.el --- File tree sidebar -*- lexical-binding: t; -*-

(use-package treemacs
	:ensure t
	:defer t
	:config
		(add-to-list 'treemacs-TAB-actions-config '(tag-node . treemacs-toggle-node))
		;; Don't need large icons, just something to indicate the file type
		(treemacs-resize-icons 14))

;; Define primary evil command for opening treemacs
(use-package emacs
	:after evil
	:config
	(evil-define-key '(normal visual) 'global (kbd "C-n") (cons "treemacs" #'treemacs)))

;; Evil mappings for treemacs
(use-package treemacs-evil
	:after (treemacs evil)
	:ensure t
	:config
		(evil-define-key 'treemacs treemacs-mode-map leader-key (cons "leader" leader-keymap))
		(evil-define-key 'treemacs treemacs-mode-map (kbd "C-n") (cons "treemacs" #'treemacs)))

;; Tells treemacs to show file state changes if magit does something
(use-package treemacs-magit
	:ensure t
	:after (treemacs magit))

;; Work with projectile projects
(use-package treemacs-projectile
	:ensure t
	:after (treemacs projectile))

;; Use treemacs icons in dired
(use-package treemacs-icons-dired
	:ensure t
	:hook (dired-mode . treemacs-icons-dired-enable-once))

