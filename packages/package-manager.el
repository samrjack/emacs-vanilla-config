;;; package-manager.el --- Elpaca extras -*- lexical-binding: t; -*-

;; Although elpaca should already be installed through bootstrapping, this section
;; is for adding packages or settings ment to make working with elpaca Easier.

(use-package melpulls
	:ensure (:host github :repo "progfolio/melpulls")
	:after elpaca
	:config (add-to-list 'elpaca-menu-functions #'melpulls))
