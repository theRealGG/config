;;________________________________________________________________________________________
;; package-manager settings
;;________________________________________________________________________________________
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa"     . "https://melpa.org/packages/")
                         ("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; setup use-package for package management
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; mac specific settings
(if (eq system-type 'darwin)
 (setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)
)

;;________________________________________________________________________________________
;; backup settings
;;________________________________________________________________________________________
(setq make-backup-files nil) ;; stop creating those backup~ files
(setq auto-save-default nil) ;; stop creating those #autosave# files

;;________________________________________________________________________________________
;; look settings
;;________________________________________________________________________________________

(if window-system
    (progn
      ;; disable annoying graphical elements
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; disable menu bar
(menu-bar-mode -1)
;; no welcome screen
(setq inhibit-startup-screen t)

;; enable line numbering
(use-package linum
  :config
  (global-linum-mode 1))

;; set larger font size 
(set-frame-font "Menlo 24" nil t)
;;use larger font

;; disable annoying ring bell 
(setq ring-bell-function 'ignore)
;; start window in full size 
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; theme settings and font size
(load-theme 'spacemacs-dark t)

;;________________________________________________________________________________________
;; org mode  settings
;;________________________________________________________________________________________

(use-package org
  :mode (("\\.\\(org\\|org_archive\\)$" . org-mode))
  :ensure org-plus-contrib
  :config 
  (progn
    (setq org-hide-leading-stars 'hidestars)
    (setq org-return-follows-link t)
    (setq org-drawers (quote ("PROPERTIES" "CLOCKTABLE" "LOGBOOK" "CLOCK")))
    (setq org-completion-use-ido t)
    (setq org-tags-exclude-from-inheritance '("review"))))

(use-package org-download
  :ensure t)

;; Ein "!" bedeutet Zeitstempel
;; Ein "@" bedeutet Notiz
(setq org-todo-keywords
 '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "APPT(a)" "PROJ(p)" "NOTIZ(n)" "BESPROCHEN(b)"
             "DELEGATED(g@/!)" "|" "DONE(d!)" "ZKTO(z)" "CANCELED(c@)")))

;; Org-Agenda mit C-c a aufrufen 
(global-set-key "\C-ca" 'org-agenda)

;; Farben anpassen
(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "#b70101" :weight bold))
        ("STARTED"  . (:foreground "#b70101" :weight bold))
        ("APPT"  . (:foreground "sienna" :weight bold))
        ("PROJ"  . (:foreground "lightblue" :weight bold))
        ("NOTIZ"  . (:foreground "yellow" :weight bold))
        ("ZKTO"  . (:foreground "orange" :weight bold))
        ("WAITING"  . (:foreground "orange" :weight bold))
        ("BESPROCHEN"  . (:foreground "darkorange" :weight bold))
        ("REVIEWED"  . (:foreground "forestgreen" :weight bold))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("DELEGATED"  . (:foreground "forestgreen" :weight bold))
        ("CANCELED"  . shadow)))

;; Fast TODO Selection
(setq org-use-fast-todo-selection t)

(setq org-log-done 'time)
(setq org-log-into-drawer t)
;; Aktuelle Zeile in der Agenda hervorheben
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1 )))

(setq org-agenda-format-date
 "%Y-%m-%d ---------------------------------------------------------------------")

;; Tasks mit Prioriäten unterschiedlich darstellen:
(setq org-agenda-fontify-priorities
   (quote ((65 (:foreground "Red")) (66 (:foreground "Blue")) (67 (:foreground "Darkgreen")))))

(setq org-agenda-date-weekend (quote (:foreground "Yellow" :weight bold)))

;; Tasks mit Datum in der Agenda ausblenden, wenn sie bereits erledigt sind:
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-filter-preset '("-someday"))
(setq org-agenda-span 1)
(setq org-agenda-include-diary t)

(setq org-agenda-files (quote 
   ("~/org/work.org"
    "~/org/private.org"
    "~/org/uni.org"
    "~/org/projects.org")))

(setq org-agenda-window-setup 'current-window)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;________________________________________________________________________________________
;; edit settings
;;________________________________________________________________________________________

;; company mode
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (global-company-mode t)
  (defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas)
	  (and (listp backend) (member 'company-yasnippet backend)))
	backend
      (append
      (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))

;; yasnippet settings
(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/snippets")))
  (yas-reload-all)
  (yas-global-mode))

;; auto close bracket insertion.
(use-package electric
  :config
  (electric-pair-mode 1))
;;________________________________________________________________________________________
;; programming related settings
;;________________________________________________________________________________________

;; git settings
(use-package magit
    :bind ("C-x g" . magit-status))

;; markdown settings
(use-package markdown-mode
    :commands (markdown-mode gfm-mode)
    :mode (("README\\.md\\'" . gfm-mode)
           ("\\.md\\'" . markdown-mode)
           ("\\.markdown\\'" . markdown-mode))
    :init (setq markdown-command "multimarkdown"))

;; enable cmake
(use-package cmake-mode)
