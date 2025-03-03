(use-package helpful
	:ensure t
	;; prevent native-compiler errors
	:functions shortdoc-function-groups
	:config
		(define-key help-map (kbd ".") (cons "describe function" #'helpful-at-point))
		(define-key help-map (kbd "f") (cons "describe function" #'helpful-callable))
		(define-key help-map (kbd "v") (cons "describe function" #'helpful-variable))
		(define-key help-map (kbd "k") (cons "describe function" #'helpful-key))
		(define-key help-map (kbd "x") (cons "describe function" #'helpful-command)))

; inject demos into `helpful`'s help display
(use-package elisp-demos
	:ensure t
	:after helpful
	:config
		(advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update))
