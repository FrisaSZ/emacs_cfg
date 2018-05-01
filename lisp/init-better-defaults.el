;; 调整emacs默认行为

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
;; require 的作用是加载一个特性
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 确认输入的yes or no改成y or no
;;(fset 'yes-or-no-p 'y-or-n-p)

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

;; 用C-x C-j打开当前文件所在目录
(require 'dired-x)

;; dired mode下用C复制文件时自动把路径补全为另一个dired buffer对应的目录，
;; 方便双窗口显示目录后复制文件
(setq dired-dwim-target t)

(provide 'init-better-defaults)
