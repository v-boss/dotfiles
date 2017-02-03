;;General Emacs Look and Feel
(provide 'dg-general)

(setq inhibit-startup-screen t)
(setq transient-mark-mode t)

;;I prefer Y/N
(fset 'yes-or-no-p 'y-or-n-p)

;;Line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)
(toggle-scroll-bar t)

;;Line Wrap at 80
(set-default 'fill-column 80)

;;Stop Beeping
(setq visible-bell t)

;;Remove Autosave
(setq auto-save-default t)

;; Monokai Theme
(load-theme 'monokai t)
;; Enable Monokai
(enable-theme 'monokai)
;; (setq ;; foreground and background
;;  monokai-foreground     "#ABB2BF"
;;  monokai-background     "#2f343f"
;;  ;; highlights and comments
;;  monokai-comments       "#F8F8F0"
;;  monokai-emphasis       "#282C34"
;;  monokai-highlight      "#FFB269"
;;  monokai-highlight-alt  "#66D9EF"
;;  monokai-highlight-line "#1B1D1E"
;;  monokai-line-number    "#F8F8F0"
;;  ;; colours
;;  monokai-blue           "#61AFEF"
;;  monokai-cyan           "#56B6C2"
;;  monokai-green          "#98C379"
;;  monokai-gray           "#3E4451"
;;  monokai-violet         "#C678DD"
;;  monokai-red            "#E06C75"
;;  monokai-orange         "#D19A66"
;;  monokai-yellow         "#E5C07B")


;;Solarized look and feel
;;(load-theme 'solarized t)
;;(set-frame-parameter nil 'background-mode 'dark)
;;(enable-theme 'solarized)

;;The Infernal Cat
(nyan-mode)

;;Lets try forcing everything to be in utf8
;; This fixes another bit of "Fun" where Wanderlust / Davmail use US-ASCII
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(defun elmo-imap4-detect-search-charset (str) 'utf-8)

;;As Flyspell will run on startup we may want to disable progress in status bar
(setq flyspell-issue-message-flag nil)

;; FlySpell Config
;; easy spell check
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

