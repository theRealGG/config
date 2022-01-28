;; Commentary: emacs config

;; additional package repository
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; install use-package automatically
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))


;; get rid of splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; start in fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; font size
;; (set-face-font 'default "Fira Code-18")
(set-face-attribute 'default nil
		    :font "Source Code Pro"
		    :height 220
		    :weight 'medium)
(set-face-attribute 'variable-pitch nil
		    :font "Source Code Pro"
		    :height 220
		    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
		    :font "Source Code Pro"
		    :height 220
		    :weight 'medium)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
		    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
		    :slant 'italic)

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)

;; Needed if using emacsclient. Otherwise, your fonts will be smaller than expected.
(add-to-list 'default-frame-alist '(font . "Source Code Pro-20"))
;; changes certain keywords to symbols, such as lamda!
(setq global-prettify-symbols-mode t)


;;; no backup files
(setq make-backup-files nil)
(global-auto-revert-mode t)

;; display line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))


(use-package dashboard
	     :init      ;; tweak dashboard config before loading it
	     (setq dashboard-set-heading-icons t)
	     (setq dashboard-set-file-icons t)
	     (setq dashboard-banner-logo-title "Welcome Hisham!")
	     ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
	     (setq dashboard-center-content nil) ;; set to 't' for centered content
	     (setq dashboard-items '((recents . 5)
				     (agenda . 5 )
				     (bookmarks . 3)
				     (projects . 3)
				     (registers . 3)))
	     :config
	     (dashboard-setup-startup-hook)
	     (dashboard-modify-heading-icons '((recents . "file-text")
					       (bookmarks . "book"))))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; disable toolbar, scrollbar, ring bell
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq ring-bell-function 'ignore)


;; Highlight current line.
(global-hl-line-mode t)

;; encoding
(prefer-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")

(use-package doom-themes
	     :ensure t
	     :config
	     ;; Global settings (defaults)
	     (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
		   doom-themes-enable-italic t) ; if nil, italics is universally disabled
	     (load-theme 'doom-one t)

	     ;; Enable flashing mode-line on errors
	     (doom-themes-visual-bell-config)
	     ;; Enable custom neotree theme (all-the-icons must be installed!)
	     (doom-themes-neotree-config)
	     ;; or for treemacs users
	     (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
	     (doom-themes-treemacs-config)
	     ;; Corrects (and improves) org-mode's native fontification.
	     (doom-themes-org-config))

(setq doom-theme 'doom-one)

(require 'evil)
(evil-mode 1)

;; snippets
(use-package yasnippet                  ; Snippets
	     :ensure t
	     :config
	     (setq
	       yas-verbosity 1                      ; No need to be so verbose
	       yas-wrap-around-region t)
	     (yas-global-mode 1))

(use-package yasnippet-snippets         ; Collection of snippets
	     :ensure t)

;; auto closing brackets
(electric-pair-mode 1)

;; == irony-mode ==
(use-package irony
	     :ensure t
	     :defer t
	     :init
	     (add-hook 'c++-mode-hook 'irony-mode)
	     (add-hook 'c-mode-hook 'irony-mode)
	     (add-hook 'objc-mode-hook 'irony-mode)
	     :config
	     ;; replace the `completion-at-point' and `complete-symbol' bindings in
	     ;; irony-mode's buffers by irony-mode's function
	     (defun my-irony-mode-hook ()
	       (define-key irony-mode-map [remap completion-at-point]
			   'irony-completion-at-point-async)
	       (define-key irony-mode-map [remap complete-symbol]
			   'irony-completion-at-point-async))
	     (add-hook 'irony-mode-hook 'my-irony-mode-hook)
	     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
	     )

;; Company (auto completion)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(setq company-backends '((company-capf company-irony company-files company-elisp company-inf-ruby company-anaconda company-go company-irony company-cmake company-jedi company-css company-yasnippet) (company-dabbrev company-dabbrev-code)))

;; c++ settings
(use-package modern-cpp-font-lock
	     :ensure t)

(setq-default c-basic-offset 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(spacemacs-theme cmake-ide monokai-theme monokai-themeokai cmake-font-lock company-glsl company-jedi use-package dracula-theme dashboard)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
