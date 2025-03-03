;; Startup
(setq gc-cons-threshold #x40000000)

(setq message-log-max 10000) ; Give plenty of log space

(setq read-process-output-max (* 1024 1024 4))

;; Temporary
(setq default-frame-alist
       '((top . 10) (left . 10) (width . 200) (height . 200)))



;;; Set up file loacations
(setq local-dir (expand-file-name ".local" config-directory))
(make-directory local-dir 'parents)
(setq backup-dir (expand-file-name "file-backups" local-dir))
(make-directory backup-dir 'parents)
(setq bootstrap-dir (expand-file-name "bootstrap" config-directory))
(make-directory bootstrap-dir 'parents)

(setq packages-dir (expand-file-name "packages" config-directory))

(setq custom-file (expand-file-name "custom.el" config-directory))
(load custom-file 'noerror)

;; backup files
(setq backup-directory-alist '((".*" . backup-dir))
      tramp-backup-directory-alist '((".*" . backup-dir))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
)

;; Package Manager
(load (expand-file-name "package-manager.el" bootstrap-dir) 'noerror)


; Load all package files
(dolist (file (directory-files-recursively packages-dir "\\.elc?$" nil t))
	(load file 'noerror))

;;;; Package files under review


;; Finish initilization

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 10 1024 1024)) ;; 10mb
