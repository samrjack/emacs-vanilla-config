;;; buffers.el --- Buffer management -*- lexical-binding: t; -*-

(defun local/new-buffer ()
	"Create a new buffer"
	(interactive)
		(let ((buffer (generate-local/new-buffer "*new*")))
			(set-buffer-major-mode buffer)
			(set-window-buffer nil buffer)))

(use-package emacs
	:ensure nil
	:after leader-keymapping
	:config
	(setq buffer-leader-keymap (make-sparse-keymap))
	(define-key leader-keymap (kbd "b") (cons "buffers" buffer-leader-keymap))

	(define-key buffer-leader-keymap (kbd "b") (cons "list buffers" #'ibuffer))
	(define-key buffer-leader-keymap (kbd "l") (cons "list buffers" #'ibuffer))
	(define-key buffer-leader-keymap (kbd "p") (cons "previous buffer" #'previous-buffer))
	(define-key buffer-leader-keymap (kbd "[") (cons "previous buffer" #'previous-buffer))
	(define-key buffer-leader-keymap (kbd "n") (cons "next buffer" #'next-buffer))
	(define-key buffer-leader-keymap (kbd "]") (cons "next buffer" #'next-buffer))
	(define-key buffer-leader-keymap (kbd "k") (cons "kill buffer" #'kill-buffer))
	(define-key buffer-leader-keymap (kbd "s") (cons "save buffer" #'save-buffer))
	;; (define-key buffer-leader-keymap (kbd "S") (cons "save all buffers" #'save-buffer)) ; TODO
	(define-key buffer-leader-keymap (kbd "N") (cons "new buffer" #'local/new-buffer))

	;; Bookmark bindings
	(define-key buffer-leader-keymap (kbd "m") (cons "create bookmark" #'bookmark-set))
	(define-key buffer-leader-keymap (kbd "M") (cons "delete bookmark" #'bookmark-delete))

	;; Narrowing
	(define-key buffer-leader-keymap (kbd "-") (cons "narrowing" narrow-map))

	(provide 'buffer-leader-keymapping))
