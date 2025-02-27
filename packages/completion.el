;; Completion engine

; with some tweaks, pulled from https://github.com/minad/vertico?tab=readme-ov-file#configuration
(use-package vertico
	:ensure t
	:demand t
	:custom
		(vertico-count 20) ;; Show more candidates
		(vertico-resize t) ;; Grow and shrink the Vertico minibuffer
		(vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
	:config
		(vertico-mode 1))

;; Optionally use the `orderless' completion style.
(use-package orderless
	:ensure t
	:demand t
	:custom
		;; Configure a custom style dispatcher (see the Consult wiki)
		;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
		;; (orderless-component-separator #'orderless-escapable-split-on-space)
		(completion-styles '(orderless basic))
		(completion-category-defaults nil)
		(completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
	:ensure t
	:demand t
	;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
	;; available in the *Completions* buffer, add it to the
	;; `completion-list-mode-map'.
	;:bind (:map minibuffer-local-map
	;       ("M-A" . marginalia-cycle))

	:config
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
