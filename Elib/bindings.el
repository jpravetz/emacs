;----------------------------------------------------------------------------
;
; Filename:	bindings.el
;
; Description:	key bindings
;
; Update History: (most recent first)
;;  27-Oct-1997 jpravetz -- Added insert-method-header call
;    J. Pravetz  04-Nov-96 20:33 -- Added eval-expression, byte offsets
;    J. Pravetz  18-Jan-96 12:15 -- Added this header
;
;----------------------------------------------------------------------------

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-cu" 'update-update-history)
(global-set-key "\C-ch" 'update-history-header)
(global-set-key "\C-cm" 'insert-method-header)
(global-set-key "\C-x!" 'eval-expression)

(global-set-key "\en" 'scroll-up-1)
(global-set-key "\ep" 'scroll-down-1)
(global-set-key "\er" 'query-replace)
;(global-set-key "\eq" 'fill-paragraph)
;(global-set-key "\er" 'replace-string)

(global-set-key "\C-x=" 'what-line)
(global-set-key "\C-xc" 'insert-cut-string)
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-xP" 'byte-offset)
(global-set-key "\C-xp" 'goto-byte-offset)

(global-set-key "\C-x\C-i" 'insert-file)
(global-set-key "\C-x\C-k" 'kill-compilation)
(global-set-key "\C-x\C-p" 'lpr-buffer)

(define-key minibuffer-local-completion-map "\ " 'minibuffer-complete-and-exit)
(define-key minibuffer-local-must-match-map "\ " 'minibuffer-complete-and-exit)

; (define-key shell-mode-map "\t" 'maclib-complete)
