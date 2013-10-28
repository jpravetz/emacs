;----------------------------------------------------------------------------
;
; Filename:	macosx.el
;
; Description:	Settings specific to windows 95 operation.
;
; Update History: (most recent first)
;;  28-Oct-2013 jpravetz -- Set window size conditionally only for aquaemacs
;;  15-Jul-2007 jpravetz -- Created from win95.el
;;  08-Nov-1999 jpravetz -- Updated frame size
;;  27-Oct-1997 jpravetz -- Changed default dimensions to 77x108
;    jpravetz  24-Mar-1997 15:34 -- Changed default dimensions for 21" screen
;    J. Pravetz  16-Nov-96 18:36 -- Commented out color changes
;    J. Pravetz  27-Oct-96 18:29 -- Added this header
;
;----------------------------------------------------------------------------

; This sets the default font
; (set-default-font "-*-Courier New-normal-r-*-*-12-90-*-*-c-*-*-ansi-")

; Set default frame size (with above font the frame size otherwise gets
; set too big)
(when (boundp 'aquamacs-version)
  (set-frame-height (selected-frame) 52)
  (set-frame-width (selected-frame) 112))

(defun my-new-frame-with-new-scratch ()
  (interactive)
  (let ((one-buffer-one-frame t))
    (new-frame-with-new-scratch)))

; Set colors
;(set-background-color "lightgray")
;(set-foreground-color "White")
;(set-face-foreground 'modeline "black")
;(set-face-background 'highlight "forestgreen")
;(set-face-background 'region "green")
;(set-cursor-color "yellow")
