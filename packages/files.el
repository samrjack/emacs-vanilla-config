; Auto revert watches for changes to file on disk and immediately reflects them in the buffer.
(use-package autorevert
	:ensure nil
	:hook (after-init . global-auto-revert-mode))
