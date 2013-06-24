;;--------------------------------------------------------------------------
;;
;; Filename:	html.el
;;
;; Update History: (most recent first)
;;    J. Pravetz  24-Nov-96 16:19 -- Created
;;--------------------------------------------------------------------------

;; This loads html-mode from a newer package then existed in the
;; released emacs.

(autoload 'html-mode "hm--html-menu" "HTML major mode." t)
(or (assoc "\\.html$" auto-mode-alist)
    (setq auto-mode-alist (cons '("\\.html$" . html-mode) 
				auto-mode-alist)))

(autoload 'tmpl-expand-templates-in-buffer "tmpl-minor-mode"
  "Expand all templates in the current buffer." t)

; (autoload 'html-view-start-mosaic "html-view" "Start Xmosaic." t)
;(autoload 'html-view-view-buffer 
;  "html-view"
;  "View the current buffer in Xmosaic."
;  t)
;(autoload 'html-view-view-file 
;  "html-view"
;  "View a file in Xmosaic."
;  t)
;(autoload 'html-view-goto-url
;  "html-view"
;  "Goto url in Xmosaic."
;  t)
;(autoload 'html-view-get-display
;  "html-view"
;  "Get the display for Xmosaic (i.e. hostxy:0.0)."
;  t)
;(autoload 'w3-preview-this-buffer "w3" "WWW Previewer" t)
;(autoload 'w3 "w3" "WWW Browser" t)
;(autoload 'w3-open-local "w3" "Open local file for WWW browsing" t)
;(autoload 'w3-fetch "w3" "Open remote file for WWW browsing" t)
;(autoload 'w3-use-hotlist "w3" "Use shortcuts to view WWW docs" t)
