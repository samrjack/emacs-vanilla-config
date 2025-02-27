(use-package which-key
	:ensure t
	:hook (after-init . which-key-mode)
	:config
		(setq which-key-allow-evil-operators t
			  which-key-show-operator-state-maps t)
		(which-key-mode))

(use-package which-key
	:ensure nil
	:after (which-key leader-keymapping)
	:config
		(define-key leader-keymap (kbd "?") (cons "Top level keymap" #'which-key-show-top-level)))
;; TODO add a keybinding for viewing which-key at the top level

(use-package evil
	:after evil
	:init
	:config
		; Set the leader keys
		(evil-set-leader 'normal (kbd "SPC"))
		(evil-set-leader 'visual (kbd "SPC"))

		; Then set up the leader map
		(setq leader-keymap (make-sparse-keymap))

		(evil-define-key '(normal visual insert replace operator motion emacs) 'global (kbd "<leader>") (cons "leader" leader-keymap))
		(provide 'leader-keymapping)

		; Add existing keymaps to leader
		(define-key leader-keymap (kbd "h") (cons "help" help-map))
		(define-key leader-keymap (kbd "w") (cons "window" evil-window-map))

		; Make new mappings
		(setq toggle-leader-keymap (make-sparse-keymap))
		(define-key leader-keymap (kbd "t") (cons "toggle" toggle-leader-keymap))
		(provide 'toggle-leader-keymapping)

		(setq find-leader-keymap (make-sparse-keymap))
		(define-key leader-keymap (kbd "f") (cons "find" find-leader-keymap))
		(provide 'find-leader-keymapping)

		(define-key find-leader-keymap (kbd "f") (cons "find file" #'find-file))

	)
