;; package相关的配置

;; 引用common lisp的一些功能
(require 'cl)

;; 设置melpa源
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; 设置自己需要的package集合
(defvar fsz/packages '(company ;; 自动补全
					   tangotango-theme
					   counsel ;; 安装counsel自动安装ivy和swiper
					   smartparens
					   popwin
					   expand-region ;; 扩展选中功能
					   iedit ;; 同时编辑多块区域
					   smooth-scrolling ;; 平滑滚动
					   anaconda-mode ;; python mode
					   ggtags
					   neotree
					   ace-window
					   youdao-dictionary
					   conda
					   evil
					   ) "Default packages")
;; 设置package列表为我的package列表
(setq package-selected-packages fsz/packages)
;; 检查是否有包没安装，如果有包没安装返回nil，全安装了返回t
(defun fsz/packages-installed-p ()
  (loop for pkg in fsz/packages
		when (not (package-installed-p pkg)) do (return nil)
		finally (return t)))
;; 如果条件返回nil，就执行函数体，否则返回nil，
;; 如果有包没安装就执行安装过程
(unless (fsz/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg fsz/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; neotree开启
(require 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)

;; 开启全局自动补全
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;(global-company-mode t)
;; 默认是使用M-n M-p在补全候选中上下选择，改为使用C-n C-p在补全候选中上下选择
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; 启用括号、引号的自动补全
(smartparens-global-mode t)
;; 在emacs-lisp-mode下单引号不自动补全
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)


;; 启用popwin，自动切换光标到新打开的窗口
(require 'popwin)
(popwin-mode t)

;; 启用ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode)
              (ggtags-mode 1))))


;; 启用平滑滚动
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;; 自动列出当前buffer中的函数及变量列表
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; 开启iedit-mode
(global-set-key (kbd "M-s e") 'iedit-mode)

;; expand-region包里的扩展选中功能
(global-set-key (kbd "C-=") 'er/expand-region)

;; python mode自动启用anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)

(require 'conda)
(conda-env-initialize-interactive-shells)
(conda-env-initialize-eshell)
(setq-default mode-line-format (cons '(:exec conda-env-current-name) mode-line-format))

(require 'evil)
(evil-mode 1)

(provide 'packages-fsz)
