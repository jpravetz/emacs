;----------------------------------------------------------------------------
;
; Filename:	perlstuff.el
;
; Description:	Perl specific redefinitions
;
; Update History: (most recent first)
;    J. Pravetz  22-Jan-96 10:07 -- Added this header
;
;----------------------------------------------------------------------------

(defun perl-set-custom-indent-function ()
  "Set up perl indentation the way I like it"

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
  (defconst perl-label-offset -2
    "*Offset of Perl label lines relative to usual indentation.")
  )


(postpend-unique-hook 'perl-mode-hook 'perl-set-custom-indent-function)
