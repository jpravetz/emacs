;****************************************************************************
;
;Filename:	vmstuff.el
;
;Description:	setup stuff for vm
;
;Update History: (most recent first)
;    J. Pravetz  19-Sep-96 10:43 -- Changed phone number
;    J. Pravetz  10-Jul-96 12:40 -- Added BIKEFILE to vm-spool-files
;    J. Pravetz  18-Jan-96 12:45 -- Added some stuff
;    J. Pravetz  24-Apr-94 15:21 -- Added procmail support
;    J. Pravetz  10-Jan-94 16:15 -- Added this header
;
;***************************************************************************/

(autoload 'vm "vm" "Start VM on your primary inbox." t)
(autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
(autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
(autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
(autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
(autoload 'vm-mail "vm" "Send a mail message using VM." t)
(autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)

(setq vm-folder-directory "~/Mail/")
(setq vm-primary-inbox "~/Mail/INBOX")
(setq vm-crash-box "~/Mail/INBOX.CRASH")
(setq mail-archive-file-name "~/Mail/OUTBOX")
; (setq mail-self-blind t)
(setq mail-default-headers "Full-Name: Jim Pravetz\nPhone: 408 536 2018\n")

(setq vm-spool-files
      (list (concat rmail-spool-directory (user-login-name))
	    (expand-file-name "~/Mail/LISTS")
	    (expand-file-name "~/Mail/BIKEFILE")
	    (expand-file-name "~/Mail/PS")
	    (expand-file-name "~/Mail/FILE")
	    ))

(setq vm-circular-folders nil)
(setq vm-included-text-prefix ">  ")
(setq vm-rfc934-forwarding nil)
(setq vm-skip-deleted-messages t)
(setq vm-auto-next-message nil)
(setq vm-preview-lines nil)
(setq vm-move-after-deleting t)
(setq vm-startup-with-summary nil)
(setq vm-mutable-windows nil)
(setq vm-frame-per-edit nil)
(setq vm-mail-window-percentage 100)
(setq vm-delete-after-saving t)

(defun vm-first-message ()
  "Goto first message in folder"
  (interactive)
  (vm-goto-message 1)
  )

(defun vm-last-message ()
  "Goto last message in folder"
  (interactive)
  (vm-goto-message (string-to-int vm-ml-highest-message-number))
  )

(defun vm-quit-and-exit ()
  "Quit VM and exit emacs"
  (interactive)
  (vm-quit nil)
  (kill-emacs)
  )

(defun vm-setup-function ()
  "Set up for VM. Includes rmail compatible key bindings."
  (define-key vm-mode-map "," 'vm-beginning-of-message)
  (define-key vm-mode-map "." 'vm-end-of-message)
  (define-key vm-mode-map "<" 'vm-first-message)
  (define-key vm-mode-map ">" 'vm-last-message)
  (define-key vm-mode-map "j" 'vm-goto-message)
  (define-key vm-mode-map "o" 'vm-save-message)
  (define-key vm-mode-map "q" 'vm-quit-no-change)
  (define-key vm-mode-map "Q" 'vm-quit-and-exit)
  (define-key vm-mode-map "s" 'vm-save-and-expunge-folder)
  (define-key vm-mode-map "x" 'vm-expunge-folder)
  (define-key vm-mode-map "\en" 'scroll-up-1)
  (define-key vm-mode-map "\ep" 'scroll-down-1)
  ;
  (setq frame-icon-title-format "Mail")
  )

(defun vm-set-highlighting-function ()
  "Set up VM highlighting the way i like it"
  (set-face-property 'message-header-contents 'font "-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*")
  (set-face-property 'message-headers 'font "-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*")
  (set-face-property 'message-highlighted-header-contents 'font "-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*")
  (set-face-property 'message-headers 'foreground "wheat")
  (set-face-property 'message-highlighted-header-contents 'foreground "wheat")
  (set-face-property 'message-highlighted-header-contents 'foreground "tomato")
  (set-face-property 'message-cited-text 'font "-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*")
  (set-face-property 'message-cited-text 'foreground "pale goldenrot")
  (set-face-property 'message-highlighted-header-contents 'underline nil)
;  (set-face-property 'message-headers 'font "-*-courier-bold-o-*-*-*-120-*-*-*-*-iso8859-*")
;  (set-face-property 'message-highlighted-header-contents 'font "-*-courier-bold-o-*-*-*-120-*-*-*-*-iso8859-*")
  )

(prepend-unique-hook 'vm-mode-hook 'vm-setup-function)
(postpend-unique-hook 'vm-visit-folder-hook 'vm-set-highlighting-function)
