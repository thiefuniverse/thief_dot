;;; ~/.doom.d/self/init-input-method.el -*- lexical-binding: t; -*-

;;; *********************************************************
;;; * provide one alternative input method *
;;; *********************************************************
(provide 'init-input-method)

;;; config chinese input method
(use-package! pyim
  :ensure nil
  :demand t
  :config
  ;; 激活 basedict 拼音词库
  (use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))


  (setq default-input-method "pyim")

  ;; quanpin
  (setq pyim-default-scheme 'quanpin)

  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  ;; 开启拼音搜索功能
  (pyim-isearch-mode 1)

  ;; 使用 popup-el 来绘制选词框, 如果用 emacs26, 建议设置
  ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
  ;; 手动安装 posframe 包。
  (setq pyim-page-tooltip 'popup)

  ;; 选词框显示5个候选词
  (setq pyim-page-length 6)

  ;; use pyim when emacs startup
;;  (add-hook 'emacs-startup-hook
;;            #'(lambda () (pyim-restart-1 t)))

  (setq pyim-dicts
               '((:name "greatdict" :file "~/.doom.d/self/data/dict/pyim-greatdict.pyim.gz")
                 (:name "bigdict" :file "~/.doom.d/self/data/dict/pyim-bigdict.pyim.gz" )))

  :bind
  (("M-j" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer)
   ("C-\\" . toggle-input-method)))

;;; set default input method
;;;(setq default-input-method "pyim")
;;;(global-set-key (kbd "C-\\") 'toggle-input-method)
