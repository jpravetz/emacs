;****************************************************************************
;
;Filename:	earlyvar.el
;
;Description:	Define useful variables that need to be defined early.
;
;Update History: (most recent first)
;    J. Pravetz  20-Jul-96 10:41 -- Added .java to c++-mode list
;    J. Pravetz   3-Jan-94 15:48 -- Copied from variables.el
;
;****************************************************************************/

(setq auto-mode-alist
      (append auto-mode-alist
	      '(("\\.synopsys.*$" . c-mode)
		("\\.c$"  . c-mode)	; Added 14sep93
		("\\.h$"  . c-mode)	; Added 14sep93
		))
      )
