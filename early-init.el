;; Disable package.el so elpaca can take over
(setq package-enable-at-startup nil)

;; Set directory for packages to save data to
(setq config-directory user-emacs-directory)
;(setq user-emacs-directory (expand-file-name (file-name-concat config-directory ".local" "cache")))
