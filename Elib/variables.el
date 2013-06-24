;****************************************************************************
;
;Filename:	variables.el
;
;Description:	Define useful variables
;
;Update History: (most recent first)
;;  19-Mar-2012 jpravetz -- Added g-mode and set tab-width for go-mode to 4
;;   5-Dec-2011 jpravetz -- Added scss mode
;;   9-Apr-2011 jpravetz -- Added json javascript-mode
;;  18-Jul-2009 jpravetz -- Added org-mode
;;   9-Sep-2008 jpravetz -- Added .as in javascript-mode
;;  27-Jan-2003 jpravetz -- Added js extension for java-mode
;    jpravetz  28-Apr-1997 12:35 -- Added .c and .h to c++-mode list
;    jpravetz  30-Dec-1996 13:10 -- Added .ksh to text-mode
;    J. Pravetz  18-Sep-96 12:07 -- Removed java from c++-mode (now its own mode)
;    J. Pravetz  24-Jul-96 13:37 -- Added .java to c++-mode
;    J. Pravetz   2-Jan-96 09:39 -- Added .pm to perl mode
;    J. Pravetz  19-Dec-95 11:06 -- Added color conditional to font-lock
;    J. Pravetz  18-Dec-95 13:49 -- Added font-lock package
;    J. Pravetz  18-Dec-95 13:31 -- Brought into xemacs world
;    J. Pravetz  28-Jun-94 16:57 -- Added (setq c++-auto-hungry-initial-state 'hungry-only)
;    J. Pravetz  28-Jun-94 16:57 -- Added auto-lisp mode for .cell and .def files
;    J. Pravetz   5-Jan-94 10:51 -- Added (setq c++-auto-newline nil)
;    J. Pravetz  21-Dec-93 15:03 -- Removed .src from c-mode
;    J. Pravetz  14-Sep-93 15:41 -- Added .src .c .h to c-mode
;
;****************************************************************************/

(setq manual-program "/usr/ucb/man")
(setq include-system-name nil)
; (setq Info-directory-list (list "/usr/condor/share/info"))
; (setq Info-button-foreground "Black")
; (setq Info-button-background "grey20")
(setq auto-save-interval 1000)
(setq track-eol t)
(setq case-fold-search nil)
(setq backup-by-copying-when-linked t)
(setq lpr-switches (list "-h"))
;(setq auto-mode-alist
;      (append auto-mode-alist
;	      '(("\\.synopsys.*$" . c-mode)
;		("\\.c$"  . c-mode)	; Added 14sep93
;		("\\.h$"  . c-mode)	; Added 14sep93
;		))
;      )
(setq auto-mode-alist
      (append auto-mode-alist
	      '(("\\.cell$" . lisp-mode)
		("\\.def$"  . lisp-mode)
		("\\.c$" . c++-mode)
		("\\.h$" . c++-mode)
		("\\.js$" . java-mode)
		("\\.jsx$" . java-mode)
		("\\.as$" . javascript-mode)
		("\\.json$" . javascript-mode)
		("\\.pm$"  . perl-mode)
		("\\.ksh$" . text-mode)
		))
      )
;(setq completion-ignored-extensions
;      (append completion-ignored-extensions
;	      (list ".otl" ".err" ".mpi" ".aux" ".eps")
;	      )
;      )
(setq sun-esc-bracket t)
(setq next-line-add-newlines nil)

(put 'eval-expression 'disabled nil)

(setq enable-auto-headers nil)
(setq mail-quote-string ">  ")
(setq scroll-in-place nil)

(defun c-mode-common-custom-variables ()
  (c-set-style "java")
  (defconst c-basic-offset 4)
  (setq tab-width 4)
  )
(add-hook 'c-mode-common-hook 'c-mode-common-custom-variables 1)

(defun java-mode-common-custom-variables ()
  (c-set-style "java")
  (defconst c-basic-offset 4)
  (setq tab-width 4)
  )
(add-hook 'java-mode-hook 'java-mode-common-custom-variables 1)

;(defun perl-mode-common-custom-variables ()
;;;  (c-set-style "java")
;  (defconst c-basic-offset 4)
;  (setq tab-width 4)
;  )
;(add-hook 'perl-mode-common-hook 'perl-mode-common-custom-variables 1)


;; javascript - jpravetz 2010/11/28
(defcustom javascript-indent-level 4
  "Number of spaces for each indentation step."
  :type 'integer
  :group 'javascript)

;; perl redefinitions -- jpravetz -- 24 feb 93

(defconst perl-indent-level 4
  "*Indentation of Perl statements with respect to containing block.")
(defconst perl-continued-statement-offset 4
  "*Extra indent for lines not starting new statements.")
(defconst perl-continued-brace-offset -4
  "*Extra indent for substatements that start with open-braces.
This is in addition to perl-continued-statement-offset.")
(defconst perl-brace-offset 0
  "*Extra indentation for braces, compared with other text in same context.")
(defconst perl-brace-imaginary-offset 0
  "*Imagined indentation of an open brace that actually follows a statement.")
(defconst perl-label-offset -1
  "*Offset of Perl label lines relative to usual indentation.")


;;; func-menu is a package that scans your source file for function definitions
;;; and makes a menubar entry that lets you jump to any particular function
;;; definition by selecting it from the menu.  The following code turns this on
;;; for all of the recognized languages.  Scanning the buffer takes some time,
;;; but not much.
;;;
(cond ((string-match "XEmacs\\|Lucid" emacs-version)
       (require 'func-menu)
       (define-key global-map 'f8 'function-menu)
       (add-hook 'find-file-hooks 'fume-add-menubar-entry)
       (define-key global-map "\C-cg" 'fume-prompt-function-goto)
       (define-key global-map '(shift button3) 'mouse-function-menu)
       ))



;;; html stuff

(setq hm--html-automatic-changed-comment t)

;;; yaml-mode

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;; less-mode (used to build css files)

;;(require 'less-mode)
;;(add-to-list 'auto-mode-alist '("\\.less$" . less-mode))
;;(add-to-list 'auto-mode-alist '("\\.scss$" . less-mode))

;;; scss-mode
(add-to-list 'load-path (expand-file-name "~/Elib/scss-mode.el"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.styl$" . scss-mode))

;;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;;; go-mode
(add-to-list 'load-path (expand-file-name "~/Elib/go-mode-load.el"))
(require 'go-mode-load)

(defun go-custom ()
  "go-mode-hook"
  (set (make-local-variable 'tab-width) 4))

(add-hook 'go-mode-hook
          '(lambda () (go-custom)))