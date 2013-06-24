;***************************************************************************
;
; Filename:	.emacs
;
; Update History: (most recent first)
;;  20-Aug-2012 stage -- Modified for adminstage.armor5.com
;;   5-Dec-2011 jpravetz -- Turned off query on exit for shells
;;  13-Oct-2011 jpravetz -- Added loading of less mode file
;;  14-Aug-2007 jpravetz -- Tweeks for aquaemacs
;;  15-Jul-2007 jpravetz -- Updated for MacOSX and to use bash shell
;    jpravetz  24-Mar-1997 15:34 -- Source win95.el again
;    jpravetz  22-Feb-1997 14:34 -- Now open three shells
;    jpravetz  30-Dec-1996 20:18 -- Added mks KornShell support
;    J. Pravetz  24-Nov-96 16:21 -- Added html mode
;    J. Pravetz  16-Nov-96 15:37 -- Moved font setting from win95.el
;    J. Pravetz  27-Oct-96 18:55 -- Added font-lock
;    J. Pravetz  27-Oct-96 15:37 -- Change default font, colors
;    J. Pravetz  18-Jan-96 12:55 -- Edits
;    J. Pravetz  20-Dec-95 15:28 -- Added user-full-name redefinition
;    J. Pravetz  19-Dec-95 13:51 -- Commented out debug statements
;    J. Pravetz  15-Dec-95 15:24 -- Initial port to emacs-19
;    J. Pravetz   6-Jan-94 10:04 -- Moved (load variables) before (load functions)
;    J. Pravetz   3-Jan-94 15:52 -- Added ;(load earlyvar.el)
;    J. Pravetz  21-Dec-93 15:08 -- Moved (load variables) in front of
;                                   (if running-lemacs)
;    J. Pravetz  29-Nov-93 15:43 -- Put (load variables) in front of load Elib
;    J. Pravetz   2-Nov-93 14:35 -- Rename initial buffer to s4, open less shells
;    J. Pravetz   4-Aug-93 17:18 -- Added this header
;
;***************************************************************************

; (setq debug-on-error t)
; (setq debug-on-quit t)

(defconst user-login-name "stage")
(defconst user-full-name "stage")

(setq load-path (append (list
			 (expand-file-name "~/Elib"))
			load-path))

;;(one-buffer-one-frame-mode 0)
;;(load "macosx")
(load "variables")
(load "functions")
;;(load "unique-hooks")
(load "bindings")
(load "scss-mode")

;(load "html")

; Turn on font-lock mode globally (java not yet included in font-lock.el)
(global-font-lock-mode t)
(add-hook 'java-mode-hook 'turn-on-font-lock)

;; Set shell to work for MKS kornShell

(setq explicit-shell-file-name "/bin/bash")
(defvar explicit-sh-args
  '("-i" "-L")
  "*Args passed to inferior shell by M-x shell, if the shell is csh.
Value is a list of strings, which may be nil.")


(garbage-collect)

;; open some shells
(shell)
(rename-buffer "s2")
(shell)
(rename-buffer "s1")
(shell)
(rename-buffer "s0")

;; Don't query about the shell process on exiting emacs
;(set-process-query-on-exit-flag (get-process "shell") nil)

;(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
;  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
;  (flet ((process-list ())) ad-do-it))

;(shell-cd "~/Documents/Notes")
;(shell-cd "Users/jpravetz")

;(put 'eval-expression 'disabled nil)
