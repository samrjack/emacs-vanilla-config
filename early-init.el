;;; early-init.el --- Early initialization -*- lexical-binding: t; -*-

;; Suppress warnings about missing lexical-binding in third-party packages
(setq warning-suppress-log-types '((files)))

;; Disable package.el so elpaca can take over
(setq package-enable-at-startup nil)

;; Set directory for packages to save data to
(setq config-directory user-emacs-directory)
;(setq user-emacs-directory (expand-file-name (file-name-concat config-directory ".local" "cache")))
