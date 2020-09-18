; =====================
;; Standard Init
;; =====================
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
      (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(add-to-list 'package-archives
      '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; =========================
;; Auto Install use-package
;; =========================
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; =====================
;; Customizations
;; =====================
(display-time-mode t)

(use-package nlinum
  :ensure t)
(setq nlinum-format "%4d \u2502")
(global-nlinum-mode t)
(use-package powerline
  :ensure t)
(powerline-default-theme)

(require 'whitespace)
(global-whitespace-mode t)
;; (setq whitespace-display-mappings
;;   '(
;;     (space-mark 32 [183] [46])
;;     (newline-mark 10 [182 10])
;;     (tab-mark 9 [9655 9] [92 9])
;;     ))

(use-package helm
  :bind (("M-x" . helm-M-x))
  :ensure t)
(helm-mode t)

;; highlights cursor on buffer change
(use-package beacon
  :ensure t)
(beacon-mode t)

(use-package dimmer
  :ensure t)
(dimmer-mode t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
     ("\\.md\\'" . markdown-mode)
     ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; always use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; =====================
;; Development Setup
;; =====================
(use-package elpy
  :ensure t
  :mode "\\*.py\\'")
(setq elpy-rpc-python-command "python3")

;; parenthesis completing and matching
(use-package smartparens
  :ensure t)
(require 'smartparens-config)
;; (add-hook 'elpy-mode-hook #'smartparens-mode)

;; delimiter highlighting
(use-package rainbow-delimiters
  :ensure t)
(add-hook 'elpy-mode-hook #'rainbow-delimiters-mode)

(use-package auto-complete
  :ensure t)
(ac-config-default)

;; js linting
(use-package flymake-eslint
  :ensure t
  :mode "\\.js\\'")

;; vue specific mode
(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :config
  (add-to-list 'mmm-save-local-variables '(syntax-ppss-table buffer)))


;; csharp
(use-package omnisharp
  :ensure t
  :mode ("\\.cs\\'" . csharp-mode))


(use-package xml-mode
  :mode "\\.xml\\'")


(setq js-indent-level 2)
;; ==================================
;; Theme Customizations (Do Not Touch)
;; ==================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes '(tsdh-dark))
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2aa198")
     ("PROG" . "#268bd2")
     ("OKAY" . "#268bd2")
     ("DONT" . "#d70000")
     ("FAIL" . "#d70000")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#875f00")
     ("KLUDGE" . "#875f00")
     ("HACK" . "#875f00")
     ("TEMP" . "#875f00")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(package-selected-packages
   '(auto-complete use-package spacemacs-theme smartparens rainbow-delimiters powerline helm elpy dimmer better-defaults beacon))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#262626")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
