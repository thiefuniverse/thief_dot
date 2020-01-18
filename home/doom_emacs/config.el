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

(defun jump-hyper-terminal ()
  (interactive)
  (shell-command "hyper"))
(map! :leader :desc "jump to hyper terminal" "C-j" 'jump-hyper-terminal)

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
;;; * save file automatically *
;;; *********************************************************
(use-package! super-save
  :config
  (super-save-mode +1)
  (setq super-save-auto-save-when-idle t)
  (setq super-save-remote-files nil)
  (add-to-list 'super-save-triggers 'evil-force-normal-state)
  (add-to-list 'super-save-hook-triggers 'find-file-hook)
  (add-to-list 'super-save-hook-triggers 'evil-insert-state-exit-hook)
  (setq auto-save-default nil))

;;; save file after exiting insert state
;;;(add-hook 'evil-insert-state-exit-hook
;;;          (lambda ()
;;;            (call-interactively #'save-buffer)))

;;; *********************************************************
;;; * flycheck for c++ *
;;; *********************************************************
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

(use-package! google-c-style
  :config
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
 )

;;; *********************************************************
;;; * company headers for c,c++ *
;;; *********************************************************

;;;------------------------------------------------------------
;;; config company complete by tab or backtab
;;;------------------------------------------------------------

;;(defun company-complete-common-or-previous-cycle ()
;;  "Insert the common part of all candidates, or select the next one."
;;  (interactive)
;;  (when (company-manual-begin)
;;    (let ((tick (buffer-chars-modified-tick)))
;;      (call-interactively 'company-complete-common)
;;      (when (eq tick (buffer-chars-modified-tick))
;;        (let ((company-selection-wrap-around t))
;;          (call-interactively 'company-select-previous))))))

;;;(setq company-backends nil)
;;;(add-to-list 'company-backends 'company-yasnippet)
;;;(add-to-list 'company-backends 'company-c-headers)
;;;(defun add-hook-to-cplusplus (func-name)
;;;  "add hook function to c mode and c++ mode"
;;;  (add-hook 'c-mode-hook func-name)
;;;  (add-hook 'c++-mode-hook func-name)
;;;  )

;;;(use-package! company
;;;  :config
;;;  (add-hook-to-cplusplus 'company-mode)
;;;  )
 (add-hook 'c++-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '((company-capf company-irony company-c-headers company-dabbrev-code company-yasnippet)))))
 (add-hook 'c-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '((company-capf company-irony company-c-headers company-dabbrev-code company-yasnippet)))))

;;; switch between header file and cpp file
(map! :leader :desc "switch bewteen header and implementation file" "p s" #'ff-find-other-file)

;;; *********************************************************
;;; * config for functions args, for c++ completion *
;;; *********************************************************
;;  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
;;  (define-key company-active-map (kbd "<backtab>") 'company-complete-common-or-previous-cycle))

(setq company-idle-delay 0.5)

(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'markdown-mode-hook 'prettier-js-mode)

;;(setq +workspaces-switch-project-function #'treemacs-projectile)
;;(use-package treemacs
;;  :config
;;  (progn
;;    (defun vs//treemacs-add-project (&optional path)
;;      "Add project from `PATH' to `treemacs'."
;;      (let* ((path (or path vs-user-home-dir))
;;             (name (file-name-nondirectory
;;                    (directory-file-name (if (file-remote-p path)
;;                                             (car (last (split-string path ":")))
;;                                           path)))))
;;        (unless (treemacs-current-workspace)
;;          (treemacs--find-workspace))
;;        (treemacs-do-add-project-to-workspace path name)))))
;;
;;(use-package treemacs-projectile
;;  :after (projectile treemacs)
;;  :bind (:map global-map ([C-tab] . vs/treemacs-open))
;;  :config
;;  (progn
;;    (defun vs/treemacs-open ()
;;      "Setup project for current file and open `treemacs' buffer."
;;      (interactive)
;;      (vs//treemacs-add-project (condition-case _
;;                                    (expand-file-name (projectile-project-root))
;;                                  (error (expand-file-name default-directory))))
;;      (treemacs-select-window))))

;;; *********************************************************
;;; * config clang-format *
;;; *********************************************************
(add-hook 'c-mode-common-hook #'clang-format+-mode)
(add-hook 'c++-mode-hook #'clang-format+-mode)
(defun set-clang-format-style ()
  (defvar-local clang-format-style nil)
  (setq-local clang-format-style (concat (getenv "THIEF_HOME_PATH") "/.clang-format")))
;;;(add-hook 'clang-format+-mode-hook #'set-clang-format-style)

