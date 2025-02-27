(defun open-scratch-buffer()
	"Open the main scratch buffer."
	(interactive)
	(switch-to-buffer (get-buffer-create "*scratch*")))

(use-package evil
	:ensure nil
	:after (evil leader-keymapping)
	:config
		(define-key leader-keymap (kbd "x") (cons "scratch" #'open-scratch-buffer)))

(provide 'scratch)
