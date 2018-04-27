
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(package-initialize)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; 引用common lisp的一些功能
(require 'cl)
;; 设置自己需要的package集合
(defvar fsz/packages '(
		       company
		       github-modern-theme
		       hungry-delete
		       counsel ;; 安装counsel自动安装ivy和swiper
		       smartparens
		       sublimity
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Sarasa Term SC" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)
;; 设置行号
(global-linum-mode -1)
;; 关闭启动画面
(setq inhibit-splash-screen t)
;; 设置快捷键打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)
;; 开启全局自动补全
(global-company-mode t)
;; 设置光标类型，有些变量是buffer-local，用setq只更改当前buffer内的值，
;; 用setq-default 才能更改全局的默认值，如果变量不是buffer-local的，
;; 两个命令就没区别
(setq-default cursor-type 'hollow)
;; 禁止备份文件
(setq make-backup-files nil)
;; 启用最近文件列表
;; require 的作用是加载一个特性
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; 自动用新输入的内容替换掉选中的内容
(delete-selection-mode t)
;; 启动时自动全屏
(setq  initial-frame-alist (quote ((fullscreen . maximized))))
;; 启动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 启用括号自动补全
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;; 高亮当前行
(global-hl-line-mode t)
;; 启用主题
(load-theme 'github-modern t)
;; 启用hungry-delte模式，一次删除多个空格
(require 'hungry-delete)
(global-hungry-delete-mode t)
;; 设置buffer默认编码为utf-8
(setq default-buffer-file-coding-system 'utf-8)
;; 设置打开或新建文件时的默认编码为utf-8
(prefer-coding-system 'utf-8)
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
(require 'sublimity)
(require 'sublimity-scroll)
;; (require 'sublimity-map) ;; experimental
;; (require 'sublimity-attractive)
(sublimity-mode 1)
