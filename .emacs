;;Emacs configuaration file (Version 0.1-DG)

;;Add the main config file path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'monokai t)

;;Prereq for package stuff
(require 'package)

;;Load Configs
(require 'dg-package)
(require 'dg-general)
(require 'dg-org)
;;(require 'dg-mu4e)

;;(require 'dg-theme)
(defun elmo-imap4-detect-search-charset (str) 'utf-8)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

;; Linum-Height
(eval-after-load "linum"
  '(set-face-attribute 'linum nil :height 110))

;; Tool Bar Off
(tool-bar-mode -1) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-args-compile (quote ("-c" "--no-header" "--bare")))
 '(coffee-tab-width 2)
 '(org-agenda-files (quote ("~/Documents/Biblio/testbib.org")))
 '(package-selected-packages
   (quote
    (graphviz-dot-mode wanderlust apel color-theme-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;Coffee


(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map [(kbd "C-c c")] 'coffee-compile-file)
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))
