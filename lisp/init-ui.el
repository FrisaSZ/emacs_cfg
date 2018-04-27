;; ui相关的配置

;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭菜单栏
(menu-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)
;; 关闭响铃
(setq ring-bell-function 'ignore)
;; 设置行号
;;(global-linum-mode t)
;; 在行号和内容之间加空格
;;(setq linum-format "%d ")
;; 关闭启动画面
(setq inhibit-splash-screen t)
;; 设置光标类型，有些变量是buffer-local，用setq只更改当前buffer内的值，
;; 用setq-default 才能更改全局的默认值，如果变量不是buffer-local的，
;; 两个命令就没区别
(setq-default cursor-type 'hollow)

;; 启动时自动全屏
(setq  initial-frame-alist (quote ((fullscreen . maximized))))
;; 高亮当前行
;;(global-hl-line-mode t)
;; 设置主题
(load-theme 'monokai t)

(provide 'init-ui)
