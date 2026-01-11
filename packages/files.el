;;; files.el --- File handling -*- lexical-binding: t; -*-

;; Auto revert watches for changes to file on disk and immediately reflects them in the buffer.
(use-package autorevert
	:ensure nil
	:hook (after-config . global-auto-revert-mode))
