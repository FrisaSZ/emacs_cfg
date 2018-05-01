;; 打开neotree
(global-set-key (kbd "<f8>") 'neotree-toggle)
;; 打开~/.emacs.d/init.el
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 仅当dired特性加载之后在执行后面的快捷键设置，是个延迟设定
;; 这样就不用显式的用required 'dired了，避免不必要的负载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; expand-region包里的扩展选中功能
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'init-keybindings)
