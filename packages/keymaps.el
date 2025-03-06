(use-package which-key
	:ensure t
	:hook (after-config . which-key-mode)
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
						(define-key which-key-map (kbd "k") (cons "select keymap" #'which-key-show-full-keymap))
						(define-key which-key-map (kbd "m") (cons "major mode" #'which-key-show-full-major-mode))
						(define-key which-key-map (kbd "M") (cons "minor mode" #'which-key-show-full-minor-mode-keymap))
						full-maps)))
				which-key-map))))

(use-package emacs
	:ensure nil
	:after (which-key leader-keymapping)
	:config
		(define-key leader-keymap (kbd "?") (cons "Top level keymap" #'which-key-show-top-level)))

; Set up a leader key to show a nice menu
(use-package emacs
	:ensure nil
	:after evil
	:config
		; Then set up the leader map
		(setq leader-key (kbd "SPC"))
		(setq leader-keymap (make-sparse-keymap))

		(evil-define-key
			'(normal visual)
			'global
			leader-key
			(cons "leader" leader-keymap))
		(provide 'leader-keymapping))

; Prevent overriding the leader key
(use-package emacs
	:ensure nil
	:after leader-keymapping
	:config
		; Prevent leader from being overwritten
		(define-minor-mode high-priority-mode
			"Global minor mode for higher precedence evil keybindings."
			:global t
			:keymap (make-sparse-keymap))

		(high-priority-mode)

		(dolist (state '(normal visual insert emacs))
			(evil-make-intercept-map
			 (evil-get-auxiliary-keymap high-priority-mode-map state t t)
			 state))

		(evil-define-key '(normal visual) high-priority-mode-map leader-key (cons "leader" leader-keymap)))

; Set up basic keymappings to use in the leader menu
(use-package emacs
	:ensure nil
	:after leader-keymapping
	:config
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

		(define-key find-leader-keymap (kbd "f") (cons "find file" #'find-file)))

;; Set up insert mode keybindings
(use-package emacs
	:ensure nil
	:after evil
	:config
	(evil-define-key
		'insert
		'global
		(kbd "C-a") nil ; Global go to beginning of line
		(kbd "C-e") nil ; Global go to end of line
		(kbd "C-d") nil ; Global delete forward
		(kbd "C-k") nil ; Global kill line
		(kbd "C-q") nil ; Global quote key (can remap to something else later)
		(kbd "M-t") #'evil-shift-left-line ; mirror C-t
	))
