(use-package which-key
	:ensure t
	:hook (after-init . which-key-mode)
	:custom
		(which-key-allow-evil-operators t)
		(which-key-show-operator-state-maps t)
	:config
		(setq which-key-map (make-sparse-keymap))
		(define-key help-map (kbd "W") (cons "which-key"
			(let ((which-key-map (make-sparse-keymap)))
				(define-key which-key-map (kbd "k") (cons "select keymap" #'which-key-show-keymap))
				(define-key which-key-map (kbd "t") (cons "top level" #'which-key-show-top-level))
				(define-key which-key-map (kbd "m") (cons "major mode" #'which-key-show-major-mode))
				(define-key which-key-map (kbd "M") (cons "minor mode" #'which-key-show-minor-mode-keymap))

				(define-key which-key-map (kbd "f") (cons "full maps"
					(let ((full-maps (make-sparse-keymap)))
						(define-key which-key-map (kbd "") (cons "" #'which-key-show-full-keymap))
						(define-key which-key-map (kbd "") (cons "" #'which-key-show-full-major-mode))
						(define-key which-key-map (kbd "") (cons "" #'which-key-show-full-minor-mode-keymap))
						full-maps)))
				which-key-map))))

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
		(setq toggle-leader-key (kbd "t"))
		(define-key leader-keymap toggle-leader-key (cons "toggle" toggle-leader-keymap))
		(provide 'toggle-leader-keymapping)

		(setq find-leader-keymap (make-sparse-keymap))
		(define-key leader-keymap (kbd "f") (cons "find" find-leader-keymap))
		(provide 'find-leader-keymapping)

		(define-key find-leader-keymap (kbd "f") (cons "find file" #'find-file))

	)
