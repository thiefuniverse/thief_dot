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
;;; * multiple edit *
;;; *********************************************************
