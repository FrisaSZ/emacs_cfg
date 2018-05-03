;; package相关的配置

;; 引用common lisp的一些功能
(require 'cl)


;; 设置melpa源
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))


;; 设置自己需要的package集合
(defvar fsz/packages '(
		       company
		       northcode-theme
		       hungry-delete
		       counsel ;; 安装counsel自动安装ivy和swiper
		       smartparens
		       neotree
		       popwin
		       expand-region ;; 扩展选中功能
		       iedit ;; 同时编辑多块区域
		       smooth-scrolling ;; 平滑滚动
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
;; 打开neotree
(global-set-key (kbd "<f8>") 'neotree-toggle)


;; 开启全局自动补全
(global-company-mode t)
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


;; 启用hungry-delte模式，一次删除多个空格
(require 'hungry-delete)
(global-hungry-delete-mode t)


;; 启用popwin，自动切换光标到新打开的窗口
(require 'popwin)
(popwin-mode t)


;; 启用平滑滚动
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)


;; occur的M-s-o会正则搜索字符串并打开一个新窗口显示结果，
;; 按下回车跳转过去，可以在customize-group里设置popwin的
;; 弹出窗口位置，来控制正则搜索结果显示的窗口放置在左、右、下
;; 此时在occur buffer中按e，能进入编辑模式，直接对特定的
;; 实例进行修改。
;; 下面对occur增强，自动正则搜索当前光标下的词
;; dwim = do what i mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)


;; 自动列出当前buffer中的函数及变量列表
(global-set-key (kbd "M-s i") 'counsel-imenu)
;; 开启iedit-mode
(global-set-key (kbd "M-s e") 'iedit-mode)
;; expand-region包里的扩展选中功能
(global-set-key (kbd "C-=") 'er/expand-region)


(provide 'init-packages)
