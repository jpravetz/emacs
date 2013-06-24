;----------------------------------------------------------------------------
;
; Filename:	functions.el
;
; Description:	various custom functions
;
; Update History: (most recent first)
;;  26-Nov-2010 jpravetz -- Changed last_modified to use xmlschema
;;  11-Jan-2000 jpravetz -- Changed headers for c c++ and h
;;  27-Oct-1997 jpravetz -- Added insert-method-header function
;;  11-Oct-1997 jpravetz -- Changed c headers
;    jpravetz  24-Apr-1997 10:15 -- Changed c and java headers to be more alike
;    jpravetz  24-Nov-1996 19:19 -- Changes to headers
;    J. Pravetz  21-Nov-96 16:30 -- Added more java specific stuff
;    J. Pravetz  04-Nov-96 20:34 -- Added byte offset functions
;    J. Pravetz  27-Oct-96 18:37 -- Made more win95 compatible
;    J. Pravetz  13-Oct-96 15:14 -- Changed to use car/cdr only (no cadr)
;    J. Pravetz  28-Jun-96 16:39 -- Fixes
;    J. Pravetz  28-Jun-96 14:52 -- Added myfunc-pdfdatestr
;    J. Pravetz  20-Jun-96 12:31 -- Included timezone in last_modified
;    J. Pravetz  19-Jun-96 14:14 -- Fixes
;    J. Pravetz  19-Jun-96 11:37 -- Now update variable $last_modified
;    J. Pravetz  18-Jan-96 12:34 -- Fixed cut string function
;    J. Pravetz  19-Dec-95 15:01 -- Added this header
;
;----------------------------------------------------------------------------

;(setq debug-on-error t)
;(setq debug-on-quit t)

; Set your user name to use in history header. Must be 13 characters
; long, with name right justified, if you want to remain 'compatible'.

(setq user-history-name "   J. Pravetz")

;
; miscellaneous functions
;
;(defun list-buffers-other-window ()
;  "list buffers in another window"
;  (interactive)
;  (list-buffers)
;  (pop-to-buffer "*Buffer List*")
;  (forward-line 2)
;)

;(defun my-previous-window ()
;  "back to previous window"
;  (interactive)
;  (select-window (previous-window (selected-window)))
;)

;(defun my-next-window ()
;  "on to next window"
;  (interactive)
;  (select-window (next-window (selected-window)))
;)

(defun goto-byte-offset (arg)
  "Goto byte offset ARG, counting from 0 being first character."
  (interactive "NByte offset: ")
  (goto-char (+ arg 1)))

(defun byte-offset ()
  "Print byte offset, counting from 0 being first character."
  (interactive)
  (message "Byte offset %d" (+ (point) -1)))

(defun beginning-of-next-line ()
  "Move to the beginning of the next line."
  (interactive)
  (forward-line 1))

(defun beginning-of-previous-line ()
  "Move to the beginning of the previous line."
  (interactive)
  (forward-line -1))

(defun scroll-up-1 (&optional arg)
  "Scroll region up one line"
  (interactive)
  (scroll-up (or arg 1)))

(defun scroll-down-1 (&optional arg)
  "Scroll region down one line"
  (interactive)
  (scroll-down (or arg 1)))

; The following three functions commented out because of incompatibilities
; with win95 (and I don't know what they do anyway!) -- jpravetz 27oct96

;(defun seticonname ()
;  (icon-name (concat "*" (system-name) "*") (minibuf-screen))
;  )

;(defun my-begin-of-buffer ()
;  "go to beginning of buffer and activate region"
;  (interactive)
;  (begin-of-buffer)
;  (zmacs-activate-region)
;  )

;(defun my-end-of-buffer ()
;  "go to end of buffer and activate region"
;  (interactive)
;  (end-of-buffer)
;  (zmacs-activate-region)
;  )

;----------------------------------------------------------------------------

(defun insert-cut-string ()
  "Insert a cut-along-dotted-line string at point"
  (interactive)
  (let* ((hlist (update-history-fetch-delimiter))
	 (h0 (car hlist))
	 (h2 (car (cdr (cdr hlist))))
	 (h4 (car (cdr (cdr (cdr (cdr hlist))))))
	 (h5 (car (cdr (cdr (cdr (cdr (cdr hlist))))))))
    (insert h4)
    (insert-char h0 70)
    (insert h5)
    (insert "\n")))

(defun insert-method-header ()
  "Insert a C header before a method"
  (interactive)
  (let* ((hlist (update-history-fetch-delimiter))
	 (h0 (car hlist))
	 (h1 (car (cdr hlist)))
	 (h2 (car (cdr (cdr hlist))))
	 (h4 (car (cdr (cdr (cdr (cdr hlist))))))
	 (h5 (car (cdr (cdr (cdr (cdr (cdr hlist))))))))
    (beginning-of-line)
    (insert "\n")
    (insert h1)
	(insert-char h0 72)
	(insert "\n" h2 "\n" h2 "\n" h2 "\n" h2)
	(insert-char h0 70)
	(insert h5 "\n" )))

; returns characters to use to comment header. The elements of the
; list are
; h0 = character to be repeated on delimiter line
; h1 = first character or string of opening header line
; h2 = first character or string of header body line
; h3 = first character or string of closing header line
; h4 = first character or string of delimiter line
; h5 = last character or string of delimiter line
; h6 = first character or string of single-line comment

(defun update-history-fetch-delimiter ()
  (cond ((or (eq major-mode 'emacs-lisp-mode) (eq major-mode 'lisp-mode))
	 (list ?- ";;" ";;" ";;" ";;" "--" ";;"))
	((or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
	 (list ?\* "/*" " *" " *" "/*" "*/" "//"))
	((eq major-mode 'java-mode)
	 (list ?\* "/*" " *" "*/" "/*" "*/" "//"))
	((eq major-mode 'perl-mode)
	 (list ?# ?# ?# "##" "##" "##" ?#))
	(t (list ?- ?# ?# "#-" "#-" "--" ?#))))

; Add history headers to files

(defun update-history-date-short ()
  "Returns the current date in the format \"day-month-year hh:mm\"."
  (let* ((time-string (current-time-string))
	(day (substring time-string 8 10))
	(month (substring time-string 4 7))
	(year (substring time-string 20 24))
	)
    (concat day "-" month "-" year
			)))

(defun update-history-date ()
  "Returns the current date in the format \"day-month-year hh:mm\"."
  (let* ((time-string (current-time-string))
	(day (substring time-string 8 10))
	(month (substring time-string 4 7))
	(year (substring time-string 20 24))
	(hour-min (substring time-string 11 16)))
    (concat day "-" month "-" year " "	hour-min)))


(defun update-update-history ()
  "Update the history in a file header, most recent update first."
  (interactive)
  (myperl-update-last-modified-variable)
  (myjava-update-last-modified-variable)
  (myjavascript-update-last-modified-variable)
  (let* ((hlist (update-history-fetch-delimiter))
	 (h0 (car hlist))
	 (h1 (car (cdr hlist)))
	 (h2 (car (cdr (cdr hlist))))
	 (date-time (current-time-string)))
    (cond ((eq major-mode 'java-mode)
	   (begin-of-buffer)
	   (cond ((search-forward "@version" nil nil)
		  (end-of-line)
		  (backward-word 5)
		  (kill-line)
		  (insert (update-history-date))
		  (begin-of-buffer)
		  (cond ((search-forward "* @(#)" nil nil)
			 (end-of-line)
			 (backward-word 5)
			 (kill-line)
			 (insert (update-history-date))
			 ))))))
    (begin-of-buffer)
    (cond ((search-forward "Update History:" nil nil)
	   (end-of-line)
	   (insert "\n" h2 "  "
		   (update-history-date-short)
		   " "
		   user-login-name
		   " -- ")))
    ))

;; Require cl for 'position' operator
(require 'cl)

(defun update-history-header ()
  "Adds a new file header to a buffer."
  (interactive)
  (let* ((hlist (update-history-fetch-delimiter))
	 (h0 (car hlist))
	 (h1 (car (cdr hlist)))
	 (h2 (car (cdr (cdr hlist))))
	 (h3 (car (cdr (cdr (cdr hlist)))))
	 (h5 (car (cdr (cdr (cdr (cdr (cdr hlist)))))))
	 (date-time (current-time-string)))
    (begin-of-buffer)
    (insert "\n")
    (begin-of-buffer)
    (insert h1)
	(insert-char h0 72)
	(insert "\n" h2 " @(#)" (buffer-name) "\t1.00 "
			(update-history-date)
			"\n" h2
			"\n" h2 " Copyright (c) " (substring date-time -4)
			" Jim Pravetz. All Rights Reserved.\n"
			h2 "\n"
			h2 " NOTICE: All information contained herein is, and remains the\n"
			h2 " property of Jim Pravetz, if any.\n"
			h2 " The intellectual and technical concepts contained herein are\n"
			h2 " proprietary to Jim Pravetz and may\n"
			h2 " be covered by U.S. and Foreign Patents, patents in process, and are\n"
			h2 " protected by trade secret or copyright law.  Dissemination of this\n"
			h2 " information or reproduction of this material is strictly forbidden\n"
			h2 " unless prior written permission is obtained from Jim Pravetz.\n")
	(cond ((eq major-mode 'java-mode))
	   (t (insert h2 "\n" h2 " Description:\t\n")))
    (insert h2 "\n"
	    h2 " Update History: (most recent first)\n" h2 "  "
	    (update-history-date-short) " "
	    user-login-name
	    " -- Created"
		"\n" h2)
	(insert-char h0 70)
	(insert h5 "\n" )
    (cond ((eq major-mode 'java-mode)
		   (insert "\nimport java.util.\*\;\n\n")
		   (insert "/**\n" h2
				   " Description here."
				   "\n" h2
				   "\n" h2 " @version 1.00, "
				   (update-history-date)
				   "\n" h2 " @author <a href=\"mailto:"
				   user-login-name "@adobe.com\">"
				   user-full-name "</a>\n"
				   " */\n"))
		  ((or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
		   (insert "\n")

		   (let ((base (substring (buffer-name) 0 (position ?. (buffer-name) :from-end t)))
				 (tail (substring (buffer-name) (- (length (buffer-name)) 2))))
			 (cond ((string= (upcase tail ) ".H")
					
					; execute for .h file
					
					(let ((UPPER (concat (upcase base) "_H")))
					  (insert (concat "#ifndef " UPPER "\n"))
					  (insert (concat "#define " UPPER "\n\n"))
					  (insert "class " base " {\n\n")
					  (insert "public:\n\t// Constructors\n")
					  (insert "\t" base "() : fObj(NULL) {};\n")
					  (insert "\t\~" base "();\n\n")
					  (insert "protected:\n\t \/\/ Fields\n")
					  (insert "\tvoid* fObj;\n")
					  (insert "};\t// class " base "\n\n")
					  (insert (concat "#endif\t// " UPPER "\n"))
					  ))
				   
				   ; execute for non .h file
				   
				   (t

					(insert "#include \"" base ".h\"\n\n")
					(insert h1)
					(insert-char h0 72)
					(insert "\n" h2 " Class " base " basic methods\n" h2)
					(insert-char h0 70)
					(insert h5 "\n\n")
					(insert base "::~" base "()\n{\n\t\/\/ Do something\n}\n")
					)))
		   ))
    (begin-of-buffer)
    (search-forward "Description" nil nil)
    (end-of-line))
  (message "Added file header"))


; Add a write-file hook to update variable $last_modified

(add-hook 'ruby-mode-hook
	  (function
	   (lambda ()
	     (make-variable-buffer-local 'write-file-hooks)
	     (add-hook 'write-file-hooks 
		       'myruby-update-last-modified-variable))))
	  

(defun myruby-update-last-modified-variable ()
  "Ruby-specific function which updates a variable
\@last_modified if found in the first 4000 characters of the file."
;  (interactive)
 (save-excursion
    (let ((date-time (myfunc-xmlschemadatestr)))
      (begin-of-buffer)
      (cond ((and (eq major-mode 'ruby-mode)
		  (search-forward "LAST_MODIFIED = " 4000 t))
	     (beginning-of-line)
	     (kill-line)
	     (insert "LAST_MODIFIED = \"" date-time
		     "\"  # This line automatically generated"))))))


(add-hook 'perl-mode-hook
	  (function
	   (lambda ()
	     (make-variable-buffer-local 'write-file-hooks)
	     (add-hook 'write-file-hooks 
		       'myperl-update-last-modified-variable))))
	  

(defun myperl-update-last-modified-variable ()
  "Perl-specific function which updates a variable
\$last_modified if found in the first 4000 characters of the file."
;  (interactive)
  (save-excursion
    (let ((date-time (myfunc-xmlschemadatestr)))
      (begin-of-buffer)
      (cond ((and (eq major-mode 'perl-mode)
		  (search-forward "$last_modified = " 4000 t))
	     (beginning-of-line)
	     (kill-line)
	     (insert "$last_modified = \"" date-time
		     "\"; # This line automatically generated"))))))


(defun myjava-update-last-modified-variable ()
  "Java-specific function which updates a variable
\$last_modified if found in the first 4000 characters of the file."
;  (interactive)
  (save-excursion
    (let ((date-time (myfunc-xmlschemadatestr)))
      (begin-of-buffer)
      (cond ((and (eq major-mode 'java-mode)
		  (search-forward "String last_modified = " 4000 t))
	     (kill-line)
	     (insert "\"" date-time
		     "\"; // auto generated"))))))

(defun myjavascript-update-last-modified-variable ()
  "JavaScript-specific function which updates a variable
glast_modified if found in the first 4000 characters of the file."
;  (interactive)
  (save-excursion
    (let ((date-time (myfunc-xmlschemadatestr)))
      (begin-of-buffer)
      (cond ((and (eq major-mode 'java-mode)
		  (search-forward "var last_modified = " 4000 t))
	     (kill-line)
	     (insert "\"" date-time
		     "\"; // auto generated"))))))


(defun myfunc-get-timezone ()
  "Return timezone variable based on current-time-zone in format -0700."
  (let* ((a (car (current-time-zone)))
	 (h (floor (abs a) 3600))
	 (m (mod (abs a) 3600)))
    (format "%s%02d%02d" (if (< a 0) "-" "") h m)))
  
(defun myfunc-xmlschematimezone ()
  "Return timezone list based on current-time-zone in format -0700."
  (let* ((a (car (current-time-zone)))
	 (h (floor (abs a) 3600))
	 (m (mod (abs a) 3600)))
    (format "%s%02d:%02d" (if (< a 0) "-" "") h m)))
  

(defun myfunc-date-with-timezone ()
  "Return date stamp with timezone offset."
  (let* ((time-string (current-time-string))
	(day (substring time-string 8 10))
	(month (substring time-string 4 7))
	(year (substring time-string 20 24))
	(hms (substring time-string 11 19)))
    (concat day "-" month "-" year " " hms " " (myfunc-get-timezone))))

(defun myfunc-xmlschemadatestr ()
  "Return date stamp in PDF format with timezone offset."
  (let* ((time-string (current-time-string))
	(day (string-to-number (substring time-string 8 10)))
	(month (- 13 (length
		      (member (substring time-string 4 7)
			      '("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")))))
	(year (string-to-number (substring time-string 20 24)))
	(hour (string-to-number (substring time-string 11 13)))
	(min (string-to-number (substring time-string 14 16)))
	(sec (string-to-number (substring time-string 17 19))))
    (format "%04d-%02d-%02dT%02d:%02d:%02d%s" year month day hour min sec (myfunc-xmlschematimezone))))

;----------------------------------------------------------------------------
; redefine the standard html add comment function

(defun my-html-insert-last-modified-comment (newline)
  "Internal function of 'hm--html-insert-changed-comment'.
Inserts a newline if NEWLINE is t, before the comment is inserted.
USERNAME is the name to be inserted in the comment."
  (if newline
      (progn
	(end-of-line)
	(newline)))
  (insert "<CENTER><H6>Last Modified " (update-history-date) "</H6></CENTER>"))

; this function overrides the one built into the html package. for
; this function to work it must be loaded after the html package is loaded.
(defun hm--html-insert-changed-comment (&optional noerror)
  "The function inserts a \"changed comment\".
The comment looks like <!-- Changed by: Heiko Münkel, 10-Dec-1993 -->.
The comment will be inserted after the last \"changed comment\" line, or,
if there isn't such a line, after the \"created comment\" line, or,
after the title line. If there is no title and NOERROR is nil, an error 
message is generated. The line is not inserted after the end of the head 
or the beginning of the body.
If the last \"changed line\" is from the same author, it is only replaced
by the new one. 

Attention: Don't change the format of the lines and don't write anything
else in such a line !"
  (interactive)
  (save-excursion
    (begin-of-buffer)
    (let ((case-fold-search t)
 ;	  (end-of-head (if (search-forward "<body>" nil t)
 ;			   (point)
 ;			   (point-max)))
 ;	  (username user-full-name)
	  )
 ;      (goto-char end-of-head)
      (if (search-forward "<center><h6>Last Modified" nil t)
	  (progn
	    (beginning-of-line)
	    (delete-region (point) (progn
				     (end-of-line)
				     (point)))
	    (my-html-insert-last-modified-comment nil))
	;; new comment line
	(progn
	  (begin-of-buffer)
	  (if (search-forward "<body>" nil t)
	      (my-html-insert-last-modified-comment t)
	    (if (not noerror)
		(error 
		 "ERROR: Insert first a body in the document !"))))))))


(defun begin-of-buffer ()
  "Move point to the beginning of the buffer; leave mark at previous position."
(interactive)
(push-mark)
(goto-char (point-min)))

;(defun small-font ()
;  (interactive)
;  (font "6x10")
;  )

;(defvar lprenv-command "lpr"
;  "Shell command for printing a #10 envelope to a postscript printer")

;(defconst lprenv-switches nil
;  "*List of strings to pass as extra switch args to lprenv when it is invoked.")

;(defun lprenv-region (start end)
;  "Print buffer contents using `env10'.
;`lprenv-switches' is a list of extra switches (strings) to pass to lprenv."
;  (interactive "r")
;  (lprenv-region-1 start end lprenv-switches))

;(defun lprenv-region-1 (start end switches)
;  (let ((name (concat (buffer-name) " Emacs buffer"))
;	(width tab-width))
;    (save-excursion
;     (message "Spooling...")
;     (if (/= tab-width 8)
;	 (let ((oldbuf (current-buffer)))
;	  (set-buffer (get-buffer-create " *spool temp*"))
;	  (widen) (erase-buffer)
;	  (insert-buffer-substring oldbuf start end)
;	  (setq tab-width width)
;	  (untabify (point-min) (point-max))
;	  (setq start (point-min) end (point-max))))
;     (apply 'call-process-region
;	    (nconc (list start end lprenv-command
;			 nil nil nil)))
;     (message "Spooling...done"))))

;----------------------------------------------------------------------------
