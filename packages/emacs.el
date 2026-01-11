;;; emacs.el --- Core Emacs settings -*- lexical-binding: t; -*-

(use-package emacs
	:ensure nil
	:custom
		(column-number-mode t) ;; Display column number in modeline
		(tab-width 4) ;; Default tab width
		(pixel-scoll-precision-mode t) ;; Enable pixel-precise scrolling
		(history-length 100) ;; command history length
		(tab-always-indent 'complete) ;; Allow tab to complete and not just indent
		;; Hide commands in M-x which do not apply to the current mode.
		;; (read-extended-command-predicate #'command-completion-default-include-p)
	:init
		(tool-bar-mode -1)
		(menu-bar-mode -1)
		(scroll-bar-mode -1))

;; Convert '^L' page break characters into clean lines
;; for better reading. These are most commonly found in
;; emacs documentation.
(use-package page-break-lines
	:ensure t
	:hook (after-config . global-page-break-lines-mode))

;; Disable all blocked commands. Allow for advanced emacs usage.
(use-package gnus
	:ensure nil
	:custom
		(gnus-novice-user nil))
