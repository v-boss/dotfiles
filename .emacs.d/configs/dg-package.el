;;Package management shizzle
;;Partially nabbed from y.tsutsumi.io/emacs-from-scratch-part-2-package-management.html
(provide 'dg-package)

;;We want to load package.el first
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)


(message "%s" "Checking package requirements")

;;Lets make list of stuff I want installed by default

(defvar required-packages
  '(
    color-theme-solarized
    nyan-mode
    ox-reveal
    wanderlust
    auctex
    coffee-mode
    )
  "Packges to be installed at startup"
  )
 
(dolist (p required-packages)
  (message "Checking for %s" p)
  (when (not (package-installed-p p))
    (message "--> %s Not Installed" p)
    (condition-case err
	;;Stuff that will always be executed
	(progn
          (package-install p)
	  )
      (error
       ;;Only evaluuated in case of error
       (message "--> Error Installing Package, attempting refresh")
       (package-refresh-contents)
       (package-install p)
       )
    )
  )
)


;; (dolist (p required-packages)
;;   (message "Checking for %s" p)
;;   (when (not (package-installed-p p))
;;     (message "--> %s Not Installed" p)
;;     (package-install p)
;;     )
;;   )
