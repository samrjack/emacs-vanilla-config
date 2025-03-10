;; Guide for evil settings https://github.com/noctuid/evil-guide

;; Emulate vim
(use-package evil
	:ensure t
	:defer t
	:hook
		(after-config . evil-mode)
	:init
		(setq evil-search-module 'evil-search)
	:custom
		(evil-search-module 'evil-search)
		(evil-want-keybinding nil)
		(evil-want-integration t)
		(evil-want-C-u-scroll t)
		(evil-want-C-u-delete t)
		(evil-undo-system 'undo-tree)
		(evil-want-fine-undo t)
	:config
		(evil-define-key '(normal visual) 'global (kbd "TAB") (cons "toggle fold" #'evil-toggle-fold)))

;; Other evil settings
(use-package evil-vars
	:ensure nil
	:after evil
	:custom
		(evil-ex-search-vim-style-regexp t)
		(evil-ex-search-persistent-highlight t))

;; Add evil motion maps to lots of modes.
;; TODO - Don't overwrite '<leader>' key.
(use-package evil-collection
	:ensure t
	:hook (evil-mode . evil-collection-init)
	:custom
		(evil-collection-want-find-usages-bindings t)
		(evil-collection-setup-minibuffer t))

;; Jump around to parts of the screen more easily.
(use-package evil-easymotion
	:ensure t
	:after evil)
(use-package emacs
	:ensure nil
	:after (evil-easymotion leader-keymapping)
	:config
		(evil-define-key '(normal visual motion) 'global (kbd "g s") (cons "motion jump" evilem-map))
		(define-key leader-keymap (kbd "j") (cons "jump" evilem-map)))

;; Easy line and block commenting with 'gc'.
(use-package evil-commentary
	:ensure t
	:after evil
	:hook (prog-mode . evil-commentary-mode)
	:config
		(evil-define-key 'normal evil-commentary-mode-map (kbd "g C") #'evil-commentary-line))

;; Allow modifying surrounding syntaxes like '"' or '('.
(use-package evil-surround
	:ensure t
	:hook (evil-mode . global-evil-surround-mode))

;; Allows `%` to jump between lots of open/closing matches like HTML tags.
(use-package evil-matchit
	:ensure t
	:after evil
	:config
		(global-evil-matchit-mode 1))

;; Return to normal mode using 'jk' instad of requiring '<esc>' or 'C-g'.
(use-package evil-escape
	:ensure t
	:hook (evil-mode . evil-escape-mode)
	:custom
		(evil-escape-key-sequence "jk"))

;; Add indentation as a motion object
(use-package evil-indent-plus
	:ensure t
	:after evil
	:config
		(evil-indent-plus-default-bindings))

;; Shows number of matches when searching in evil mode
(use-package evil-anzu
	:ensure t
	:after evil
	:hook (after-config . global-anzu-mode))
(use-package emacs
	:ensure nil
	:after (evil toggle-leader-keymapping)
	:config
		(define-key toggle-leader-keymap (kbd "a") (cons "anzu" #'global-anzu-mode)))


;; Folding
(use-package hideshow
	:ensure nil
	:after toggle-leader-keymapping
	:config
		(define-key toggle-leader-keymap (kbd "f h") (cons "hide show" #'hs-minor-mode)))

