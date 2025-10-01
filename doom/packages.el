;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! nov)
(package! org-modern)
(unpin! org-roam)
(package! org-roam-ui)
(package! org-download)
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
(unpin! bibtex-completion helm-bibtex ivy-bibtex)
