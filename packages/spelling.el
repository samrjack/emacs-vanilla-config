;;; spelling.el --- Spell checking -*- lexical-binding: t; -*-

(use-package spell-fu
	:ensure t
	:hook (after-config . spell-fu-global-mode))
