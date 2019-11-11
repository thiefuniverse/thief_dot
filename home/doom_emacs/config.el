;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; *********************************************************
;;; * add some path to load path *
;;; *********************************************************
(add-to-list 'load-path (concat (file-name-directory load-file-name)))
(add-to-list 'load-path (concat (file-name-directory load-file-name) "/self" ))

;;; *********************************************************
;;; * configure line number *
;;; *********************************************************
;;; show line number
(global-display-line-numbers-mode)

;;; display line number in doom dashboard
(add-hook '+doom-dashboard-mode-hook '(lambda()
                                          (display-line-numbers-mode -1)))
;;; redefine some functions
(require 'init-reload)

;;; use one specific input method
(require 'init-input-method)


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
;;; * set font *
;;; *********************************************************
(setq doom-font (font-spec :family "Source Code Pro" :size 15))


;;; *********************************************************
;;; * no quit message *
;;; *********************************************************
(setq confirm-kill-emacs nil)

;;; *********************************************************
;;; * set tabs *
;;; *********************************************************
;;;(map! :map evil-normal-state-map "gt" )
