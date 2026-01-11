;;; dired.el --- Dired configuration -*- lexical-binding: t; -*-

(use-package dired
	:ensure nil
	:config
	(when (>= emacs-major-version 28)
		(setq dired-kill-when-opening-new-dired-buffer t))
	(setq dired-listing-switches "-alh"))

(use-package diredfl
	:ensure t
	:after dired
	:config
		(diredfl-global-mode 1))
