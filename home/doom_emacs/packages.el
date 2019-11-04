;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! pyim)
(package! pyim-greatdict :recipe (:host github :repo "tumashu/pyim-greatdict"))
