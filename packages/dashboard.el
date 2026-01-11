;;; dashboard.el --- Startup dashboard -*- lexical-binding: t; -*-

(use-package dashboard
	:ensure t
	:custom
		(dashboard-center-content t)
		(dashboard-vertically-center-content t)
		(dashboard-show-shortcuts t)
		(dashboard-startup-banner 'logo)
	:config
		(add-hook 'after-config-hook #'dashboard-insert-startupify-lists)
		(add-hook 'after-config-hook #'dashboard-initialize)
		(dashboard-setup-startup-hook))

(use-package emacs
	:ensure nil
	:after (dashboard scratch)
	:config
		(define-key dashboard-mode-map (kbd "s") (cons "open scratch buffer" #'local/open-scratch-buffer)))

(use-package emacs
	:ensure nil
	:after (dashboard scratch evil)
	:config
		(evil-define-key 'normal dashboard-mode-map (kbd "i") (cons "new buffer" #'local/evil-scratch-start-insert))
		(evil-define-key 'normal dashboard-mode-map (kbd "s") (cons "open scratch buffer" #'local/open-scratch-buffer))
		(evil-define-key 'normal dashboard-mode-map (kbd "x") (cons "open scratch buffer" #'local/open-scratch-buffer))
		(evil-define-key 'normal dashboard-mode-map (kbd "s-v") (cons "paste from clipboard" #'local/scratch-paste-clipboard)))

(use-package emacs
	:ensure nil
	:after (dashboard leader-kaymapping)
	:config
		(define-key leader-keymap (kbd "D") (cons "dashboard" #'dashboard-open)))
