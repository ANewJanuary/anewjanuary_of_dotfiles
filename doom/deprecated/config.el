;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; THEMING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; colors
(setq doom-theme 'wheatgrass)
;; transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 85))
(add-to-list 'default-frame-alist '(alpha . (95 . 85)))
;; FONTS
(setq doom-font (font-spec :family "Fira Code" :size 16)
      doom-big-font (font-spec :family "Fira Code" :size 24)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 18))
(setq-default fill-column 60)


;; STARTUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook
          (lambda ()
            (let ((height (/ (window-total-height) 3)))
              (find-file "/home/artin/Vshrd/IB/VT/KB")
              (evil-window-vsplit)
              (find-file "/home/artin/Vshrd/IB")
              (evil-window-next 2)
              (evil-window-split)
              (find-file "/home/artin/Vshrd/IB/VT/agenda.org")
              (evil-window-vsplit)
              (find-file "/home/artin/Vshrd/IB/VT/journal/")
              )))

;; KEY BINDINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-motion-state-map "E" 'evil-backward-WORD-end)
(map! :leader
      :prefix "l"
      "s" #'window-configuration-to-register
      "l" #'jump-to-register)

;; OPEN IN EXTERNAL APP
(defun xah-open-in-external-app (&optional file)
  "Open the current file or dired marked files in external app.

The app is chosen from your OS's preference."
  (interactive)
  (let ( doIt
         (myFileList
          (cond
           ((string-equal major-mode "dired-mode") (dired-get-marked-files))
           ((not file) (list (buffer-file-name)))
           (file (list file)))))

    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files? ") ) )

    (when doIt
      (cond
       ((string-equal system-type "windows-nt")
        (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList))
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (shell-command (format "open \"%s\"" fPath)) )  myFileList) )
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath)) ) myFileList) ) ) ) ) )

;; PACKAGES CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PDF VIEWER
(setq pdf-view-midnight-colors '("#FFFFFF" . "#000000"))
(map! :leader
      :prefix "t"
      "m" #'pdf-view-midnight-minor-mode)

(setq deft-extensions '("txt" "tex" "org"))
(setq deft-directory "~/Dropbox/notes")


(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; DEFT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq deft-extensions '("txt" "tex" "org"))
(setq deft-directory "~/Vshrd/IB/ZK")
(setq deft-recursive t)

;; ELFEED RSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'elfeed-search-mode-hook #'elfeed-update)
(map! :leader
      :prefix "e"
      "e" #'elfeed
      "u" #'elfeed-update)

;; LATEX CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)

;; ORG MODE CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme
(setq global-org-modern-mode t)
(with-eval-after-load 'org (global-org-modern-mode))
(setq org-hide-emphasis-markers t)
(setq org-emphasis-alist
  '(("*" (bold :foreground "Orange" ))
    ("/" (:foreground "pink" :slant italic))
    ("_" (underline :foreground "red"))
    ("=" (:background "maroon" :foreground "white"))
    ("~" (:background "blue" :foreground "white"))
    ("+" (:strike-through t))))

;; (custom-set-faces!
;;   '(org-list-dt :weight black heavy :foreground white :background dark blue)
;;   '(font-lock-comment-face nil
;;     :foreground "Green"
;;     :weight 'bold)
;;   '(hl-line :extend nil)
;;   '(org-link :inherit t :weight ultrabold :slant italic :underline "turquoise1")
;;   '(outline-1 :weight ultrabold :background "PaleGreen4" :foreground "white")
;;   '(outline-2 :weight ultrabold :foreground "DeepPink1")
;;   '(outline-3 :weight ultrabold :foreground "SeaGreen2")
;;   '(outline-4 :weight ultrabold :foreground "tomato1")
;;   '(outline-5 :weight ultrabold :foreground "goldenrod2")
;;   '(outline-6 :weight ultrabold :foreground "sienna1")
;;   '(outline-7 :weight ultrabold :foreground "turquoise1")
;;   '(outline-8 :weight ultrabold :foreground "light goldenrod yellow")
;;   '(outline-9 :weight ultrabold :foreground "lavender blush")
;;   '(default :background "black" :weight normal)
;;   '(region (t :background "orange" :foreground "black")))

(defun update-org-link-color ()
  "Update the color of org links if it's the same as the default foreground."
  (let* ((default-color (face-foreground 'default))
         (link-color (face-foreground 'org-link)))
    (when (string= default-color link-color)
      (set-face-foreground 'org-link "turquoise1"))))

(add-hook 'org-mode-hook 'update-org-link-color)

;; Bindings
(map! :leader
      :prefix "o"
      "m" #'org-emphasize
      "j" #'outline-next-heading
      "k" #'outline-previous-heading
      "h" #'outline-up-heading
      "l" #'consult-outline)
;; Journal
(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-time-format "%T"
      org-journal-date-format "%a, der %d %m %Y"
      org-journal-file-format "%Y/%m/%U/%d, %A.org"
      +org-capture-journal-file "/home/artin/Vshrd/IB/VT/journal/journal.org")

;; Directory and archiving
(setq org-directory "~/Vshrd/IB/VT/")
(setq org-log-into-drawer t)
(setq org-archive-location "/home/artin/Vshrd/IB/VT/archive.org_archive::")

;; Citar bibliography management
;; (setq org-cite-global-bibliography "/home/artin/Vshrd/Sources/0000_cite.bib"
;;       citar-library-paths (list "/home/artin/Vshrd/Sources")
;;       citar-bibliography "/home/artin/Vshrd/Sources/0000_cite.bib")

(use-package! org-roam-bibtex
  :after org-roam)

;; Refiling
(setq org-agenda-files (directory-files-recursively "~/Vshrd/IB/VT" "\\.org$"))
(setq org-refile-targes '((org-agenda-files :maxlevel . 9)))

;; Latex preview in org using webkit
(use-package! webkit-katex-render :load-path "~/emacs-webkit-katex-render"
  :commands (webkit-katex-render-mode)
  :config
  (setq webkit-katex-render--background-color (doom-color 'bg)))

;; ROAM CONFIG
;; basics
(after! org
  (setq org-roam-directory "/home/artin/Vshrd/IB/ZK"))
;; ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(map! :leader
      :prefix "n r"
      "u" #'org-roam-ui-open
      )
