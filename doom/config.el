;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; THEMING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; colors
(setq doom-theme 'wheatgrass)
;; transparency
; (set-frame-parameter (selected-frame) 'alpha '(95 . 95))
; (add-to-list 'default-frame-alist '(alpha . (95 . 95)))
;; FONTS
(setq doom-font (font-spec :family "MesloLGS NF" :size 16)
      doom-big-font (font-spec :family "MesloLGS NF" :size 24)
      doom-variable-pitch-font (font-spec :family "MesloLGS NF" :size 18))
(setq-default fill-column 60)


;; STARTUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; KEY BINDINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-motion-state-map "E" 'evil-backward-WORD-end)
(map! :leader
      :prefix "l"
      "s" #'window-configuration-to-register
      "l" #'jump-to-register)

;; PACKAGES CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PDF VIEWER
(setq pdf-view-midnight-colors '("#FFFFFF" . "#000000"))
(map! :leader
      :prefix "t"
      "m" #'pdf-view-midnight-minor-mode)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

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

;; Bindings
(map! :leader
      :prefix "o"
      "m" #'org-emphasize
      "j" #'outline-next-heading
      "k" #'outline-previous-heading
      "h" #'outline-up-heading
      "l" #'consult-outline)

