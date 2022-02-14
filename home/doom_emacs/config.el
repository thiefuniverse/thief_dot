;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; *********************************************************
;;; * config package source *
;;; *********************************************************
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;;; *********************************************************
;;; * config gc threshold*
;;; *********************************************************
;;;(setq doom-gc-cons-threshold (* 1024 1024 512))

;;; *********************************************************
;;; * add some path to load path *
;;; *********************************************************
(add-load-path! (concat (file-name-directory (or load-file-name (buffer-file-name)))))
(add-load-path! (concat (file-name-directory (or load-file-name (buffer-file-name))) "/self"))

;;; *********************************************************
;;; * configure line number *
;;; *********************************************************
;;; show line number
(global-display-line-numbers-mode)

;;; display line number in doom dashboard
(add-hook '+doom-dashboard-mode-hook (lambda()
                                          (display-line-numbers-mode -1)))
;;; redefine some functions
(require 'init-reload)

;;; *********************************************************
;;; * set jump *
;;; *********************************************************
(map! :leader :desc "jump to char" "j c" #'avy-goto-char)
(map! :leader :desc "jump to word" "j w" #'avy-goto-word-1)
(map! :leader :desc "jump to line" "j l" #'avy-goto-line)
(map! :leader :desc "jump to screen" "j s" #'ace-window)

;;; *********************************************************
;;; * config treemacs *
;;; *********************************************************
(use-package! treemacs
  :config
  :bind
  ;;; single click to open file
  (([mouse-1] . treemacs-single-click-expand-action)))


;;; *********************************************************
;;; * add some shortkey for treemacs *
;;; *********************************************************
(map! :map evil-treemacs-state-map "f" #'counsel-find-file) ;; find or create file
(map! :map evil-treemacs-state-map "+" #'make-directory)    ;; make directory
(map! :map treemacs-mode-map "ov" #'treemacs-visit-node-horizontal-split)
(map! :map treemacs-mode-map "os" #'treemacs-visit-node-vertical-split)

;;; *********************************************************
;;; * flycheck for c++ *
;;; *********************************************************
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

(add-hook 'c++-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '((company-capf company-c-headers company-dabbrev-code company-yasnippet)))))
 (add-hook 'c-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '((company-capf company-c-headers company-dabbrev-code company-yasnippet)))))

;;; switch between header file and cpp file
(map! :leader :desc "switch bewteen header and implementation file" "p s" #'ff-find-other-file)

(setq company-idle-delay 0.5)

(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'markdown-mode-hook 'prettier-js-mode)

;;; *********************************************************
;;; * config clang-format *
;;; *********************************************************
(add-hook 'c-mode-common-hook #'clang-format+-mode)
(add-hook 'c++-mode-hook #'clang-format+-mode)
(defun set-clang-format-style ()
  (defvar-local clang-format-style nil)
  (setq-local clang-format-style (concat (getenv "THIEF_HOME_PATH") "/.clang-format")))

;;; *********************************************************
;;; * config org mode truncate line *
;;; *********************************************************
(global-visual-line-mode 0)
(add-hook 'org-mode-hook
          (lambda ()
            (setq word-wrap nil)
            (setq truncate-lines nil)
            (turn-off-auto-fill)))

;;; *********************************************************
;;; * config org mode *
;;; *********************************************************
(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "?"))))))
(use-package! org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
 (let* ((variable-tuple
          (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
   '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "thiefuniverse"
      user-mail-address "thiefuniverses@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
