;;; scratch.el --- Scratch buffer utilities -*- lexical-binding: t; -*-

(defun open-scratch-buffer()
	"Open the main scratch buffer."
	(interactive)
	(switch-to-buffer (get-buffer-create "*scratch*")))


(defun evil-scratch-start-insert ()
	"Open scratch buffer and enter insert mode to begin typing immediately"
	(interactive)
	(open-scratch-buffer)
	(end-of-buffer)
	(evil-insert-state))

(defun scratch-paste-clipboard ()
	"Open scratch buffer and paste clipboard"
	(interactive)
	(switch-to-buffer (get-buffer-create "*new*"))
	(clipboard-yank))

(use-package emacs
	:ensure nil
	:after (leader-keymapping)
	:config
		(define-key leader-keymap (kbd "x") (cons "scratch" #'open-scratch-buffer)))

(provide 'scratch)
