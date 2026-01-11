;;; completion.el --- Completion framework -*- lexical-binding: t; -*-

;; Completion engine
;; with some tweaks, pulled from https://github.com/minad/vertico?tab=readme-ov-file#configuration
;; minibuffer completion
(use-package vertico
	:ensure t
	:hook (after-config . vertico-mode)
	:custom
		(vertico-count 20) ;; Show more candidates
		(vertico-resize t) ;; Grow and shrink the Vertico minibuffer
		(vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
	)

;; Optionally use the `orderless' completion style.
(use-package orderless
	:ensure t
	:after (:or vertico corefu)
	:custom
		;; Configure a custom style dispatcher (see the Consult wiki)
		;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
		;; (orderless-component-separator #'orderless-escapable-split-on-space)
		(completion-styles '(orderless basic))
		(completion-category-defaults nil)
		(completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
	:ensure t
	:hook (after-config . marginalia-mode)
	;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
	;; available in the *Completions* buffer, add it to the
	;; `completion-list-mode-map'.
	:config
		(define-key minibuffer-local-map (kbd "M-a") (cons "marginalia cycle" #'marginalia-cycle))
		(marginalia-mode 1))

(use-package emacs
	:ensure nil
	:custom
		;; Support opening new minibuffers from inside existing minibuffers.
		(enable-recursive-minibuffers t)

		;; Hide commands in M-x which do not work in the current mode.  Vertico
		;; commands are hidden in normal buffers. This setting is useful beyond
		;; Vertico.
		(read-extended-command-predicate #'command-completion-default-include-p)

		;; Do not allow the cursor in the minibuffer prompt
		(minibuffer-prompt-properties
		'(read-only t cursor-intangible t face minibuffer-prompt)))

;; In buffer completion
(use-package corfu
	:ensure t
	:hook
		(after-config . global-corfu-mode)
		(global-corfu-mode . corfu-popupinfo-mode)
	:custom
		(corfu-auto t)
		(corfu-quit-no-match 'separator)
		(corfu-preselect 'prompt)
		(global-corfu-minibuffer nil)
		(corfu-popupinfo-delay 1.0)
	:config
		(defun corfu-insert-with-passthrough ()
			"Insert current candidate.
Quit and pass the return through if no candidate is selected."
			(interactive)
			(if (>= corfu--index 0)
					(corfu--insert 'finished)
				(corfu-quit)
				;; todo find way to pass the ret key onwards
				(setq unread-command-events (listify-key-sequence (this-command-keys)))))
		(define-key corfu-map (kbd "RET") (cons "insert" #'corfu-insert-with-passthrough)))

;; Use Dabbrev with Corfu! Dabbrev is emacs' built in completion API
(use-package dabbrev
	;; Swap M-/ and C-M-/
	:bind (
		("M-/" . dabbrev-completion)
		("C-M-/" . dabbrev-expand))
	:config
	;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
	(add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
	(add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
	(add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
	(add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

(use-package cape
	:ensure t
	;; Bind prefix keymap providing all Cape commands under a mnemonic key.
	;; Press C-c p ? to for help.
	:bind ("C-c p" . cape-prefix-map) ;; Alternative key: M-<tab>, M-p, M-+
		;; Alternatively bind Cape commands individually.
		;; :bind (("C-c p d" . cape-dabbrev)
		;;        ("C-c p h" . cape-history)
		;;        ("C-c p f" . cape-file)
		;;        ...)
	:init
		;; Add to the global default value of `completion-at-point-functions' which is
		;; used by `completion-at-point'.  The order of the functions matters, the
		;; first function returning a result wins.  Note that the list of buffer-local
		;; completion functions takes precedence over the global list.
		(add-hook 'completion-at-point-functions #'cape-dabbrev)
		(add-hook 'completion-at-point-functions #'cape-file)
		(add-hook 'completion-at-point-functions #'cape-elisp-block)
		(add-hook 'completion-at-point-functions #'cape-emoji)
		(add-hook 'completion-at-point-functions #'cape-keyword)
		;; (add-hook 'completion-at-point-functions #'cape-history)
		;; ...
)

