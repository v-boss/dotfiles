;;Configuration file for Org mode goodness
(provide 'dg-org)

;;Load the relevant modules here
(require 'org)
(require 'ox-beamer)
(require 'ox-latex)
(require 'ox-reveal)

;;Languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa

;;We could do with setting up various directorys here
(setq org-ditaa-jar-path "~/.emacs.d/contrib/ditaa/ditaa.jar")

;;Babel Highlighting
(setq org-src-fontify-natively t)


;; ----- Get flyspell working with .org  ------
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)

;; --------- ORG Mode for Paper Writing ---------

;; -- Get References / Citations going  (Actually-This is Latex !ORG)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; Auktex Reftex
(autoload 'reftex-mode "reftex" "RefTex Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTex Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make Citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)

;;Hooks
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ;Auktex
(add-hook 'latex-mode-hook 'turn-on-reftex) ;Emacs Latex
;;(add-hook 'org-mode 'reftex-mode)

(setq reftex-enable-partial-scans t
      reftex-save-parse-info t
      reftex-use-multiple-selection-buffers t
      reftex-plug-into-AUCteX t)

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (reftex-mode)
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
           ;Enable Auto Revert to reload Bib file
	 (global-auto-revert-mode t)
	 (reftex-parse-all)
	 )
       )
)

(add-hook 'org-mode 'org-mode-reftex-setup)

;;Refefine C-c (
(define-key org-mode-map (kbd "C-c (") 'reftex-citation)
(define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search)
	 

;;Munge Org Exports

;; (setq org-latex-pdf-process (quote ("texi2dvi --pdf --clean --verbose --batch %f")))


;;GTD setup stuff

;;Custom Latex lasses


(setq org-export-latex-listings t)

(add-to-list 'org-latex-classes
	     '("org-article"
	       "\\documentclass{org-article}
                [NO-DEFAULT-PACKAGES]
                [NO-PACKAGES]
                "
	 	 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
              )



(add-to-list 'org-latex-classes
              '("moderncv"
                "\\documentclass{moderncv}
                [NO-DEFAULT-PACKAGES]
                [NO-PACKAGES]
                "
	 	 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
              )


(add-to-list 'org-latex-classes
              '("exam"
                "\\documentclass{exam}
                [NO-DEFAULT-PACKAGES]
                [NO-PACKAGES]
                "
	 	 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
              )
