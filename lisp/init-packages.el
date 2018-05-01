;; package相关的配置

;; 引用common lisp的一些功能
(require 'cl)
;;(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))


;; 设置自己需要的package集合
(defvar fsz/packages '(
		       company
		       northcode-theme
		       hungry-delete
		       counsel ;; 安装counsel自动安装ivy和swiper
		       smartparens
		       sublimity
		       neotree
		       popwin
		       )  "Default packages")
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

;; 开启neotree
(require 'neotree)
;; 开启全局自动补全
(global-company-mode t)
;; 启用括号自动补全
(smartparens-global-mode t)

;; 启用hungry-delte模式，一次删除多个空格
(require 'hungry-delete)
(global-hungry-delete-mode t)

;; 启用ivy
;;(ivy-mode 1)
;;(setq ivy-use-virtual-buffers t)
;;(setq enable-recursive-minibuffers t)
;;(global-set-key "\C-s" 'swiper)
;;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;; 平滑滚动，minimap，集中注意力模式
;;(require 'sublimity)
;;(require 'sublimity-scroll)
;;(require 'sublimity-map) ;; experimental
;;(require 'sublimity-attractive)
;;(sublimity-mode 1)

;; 启用popwin，自动切换光标到新打开的窗口
(require 'popwin)
(popwin-mode t)



(provide 'init-packages)
