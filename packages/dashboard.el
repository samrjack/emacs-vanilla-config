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

(use-package dashboard
	:ensure nil
	:after (dashboard scratch)
	:config
	(define-key dashboard-mode-map (kbd "s") (cons "open scratch buffer" #'open-scratch-buffer)))

(use-package dashboard
	:ensure nil
	:after (dashboard scratch evil)
	:config
	(evil-define-key 'normal dashboard-mode-map (kbd "s") (cons "open scratch buffer" #'open-scratch-buffer))
	(evil-define-key 'normal dashboard-mode-map (kbd "x") (cons "open scratch buffer" #'open-scratch-buffer)))
