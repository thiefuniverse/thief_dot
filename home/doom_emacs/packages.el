;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

;;(package! pyim)
;;(package! pyim-greatdict :recipe 
;;  (:host github 
;;   :repo "tumashu/pyim-greatdict"))

(package! super-save)
(package! company-c-headers)
(package! function-args)
(package! prettier-js)
(package! clang-format)
(package! clang-format+ :recipe
  (:host github
   :repo "SavchenkoValeriy/emacs-clang-format-plus"))
(package! org2blog)
(package! emojify)
(package! eglot)
(package! yasnippet :pin "d3d6d70b1cd4818d271752468e0fdb0788db750d")

