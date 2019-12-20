;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! pyim)
(package! pyim-greatdict :recipe (:host github :repo "tumashu/pyim-greatdict"))

(package! super-save)

;;; *********************************************************
;;; * save file automatically *
;;; *********************************************************
(use-package! super-save
  :ensure t
  :config
  (super-save-mode +1))


(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)
