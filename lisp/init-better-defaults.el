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
(provide 'init-better-defaults)
