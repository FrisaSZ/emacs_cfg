;; emacs内建功能的配置

;; 禁止备份文件
(setq make-backup-files nil)
;; 禁止自动保存
(setq auto-save-default nil)
;; 自动用新输入的内容替换掉选中的内容
(delete-selection-mode t)
;; 启动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 设置buffer默认编码为utf-8
(setq default-buffer-file-coding-system 'utf-8)
;; 设置打开或新建文件时的默认编码为utf-8
(prefer-coding-system 'utf-8)
;; 文件在外部修改了，自动加载
(global-auto-revert-mode t)

;; 启用最近文件列表
(recentf-mode t)
(setq recentf-max-menu-items 32)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 拷贝目录时始终递归拷贝
(setq dired-recursive-copies 'always)
;; 删除目录时始终递归删除
(setq dired-recursive-deletes 'always)

;; 重用唯一的一个缓冲区作为dired mode 显示专用缓冲区，避免每次打开
;; 一个目录都重新打开一个dired buffer，当然仅仅是指在一个窗口内部
;; 不断进进出出目录时。如果单独在另外一个窗口打开别的目录还是会新建
;; 另一个buffer。
;; 文档描述:In Dired, visit this file or directory instead of the Dired buffer.
(put 'dired-find-alternate-file 'disabled nil)
;; 仅当dired特性加载之后在执行后面的快捷键设置，是个延迟设定
;; 这样就不用显式的用required 'dired了，避免不必要的负载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; 用C-x C-j打开当前文件所在目录
(require 'dired-x)
;; dired mode下用C复制文件时自动把路径补全为另一个dired buffer对应的目录，
;; 方便双窗口显示目录后复制文件
(setq dired-dwim-target t)

;; 整体功能：让光标处于括号中间时也能对两侧括号高亮，使用defin-advice增强
;; 已有的show-paren-function功能
;; fn指代被装饰的函数，先用正则表达式判断是否就在括号外侧，是的话直接调用
;; fn，否则的话先往回移动光标到外一层括号，然后调用fn，然后用于设置了
;; save-excursion，调用完fn实现高亮后又把光标放回原来位置
;; ps:这里的正则表达式的写法还有待测试，发现不管怎么写，最终效果都一样
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(") (funcall fn))
		(t (save-excursion
			 (ignore-errors (backward-up-list))
			 (funcall fn)))))

;; 删除windows下的换行符^M
(defun remove-dos-eol ()
  (interactive)
  (goto-char (point-min)) ;; 跳转到buffer最开始，相当于快捷键M-<
  (while (search-backward "\r" nil t) (replace-match ""))) ;; 前向搜索"\r"替换为空

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

;; 关闭工具栏
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
;; 关闭菜单栏
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
;; 关闭滚动条
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
;; 关闭响铃
(setq ring-bell-function 'ignore)
;;(when (fboundp 'pixel-scroll-mode)
;;  (pixel-scroll-mode 1))
;; 设置行号
;;(global-linum-mode t)
;; 在行号和内容之间加空格
;;(setq linum-format "%d ")
;; 关闭启动画面
(setq inhibit-splash-screen t)
;; 设置光标类型，有些变量是buffer-local，用setq只更改当前buffer内的值，
;; 用setq-default 才能更改全局的默认值，如果变量不是buffer-local的，
;; 两个命令就没区别
(setq-default cursor-type 'box)

;; 启动时自动全屏
(setq  initial-frame-alist (quote ((fullscreen . maximized))))
;; 加载主题
(load-theme 'tangotango t)
(if (display-graphic-p)
    (progn
      (message "emacs runs in graphic")
	  )
  (progn
	(message "emacs runs in terminal")
	)
  )

;; tab-width是buffer-local的
(setq-default tab-width 4)

;; 开关行号
(setq linum-format "%d ")
(global-set-key (kbd "M-o L") 'global-linum-mode)
;; 开关高亮当前行
(global-set-key (kbd "M-o H") 'global-hl-line-mode)

;; 设置默认字体
(when (member "Sarasa Term SC" (font-family-list)) (set-frame-font "Sarasa Term SC-12" t t))

;; 鼠标滚动
(setq mouse-wheel-scroll-amount '(2 ((shift) . 5) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(provide 'builtin-fsz)
