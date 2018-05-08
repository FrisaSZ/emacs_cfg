;; 自定义的函数

;; 打开自己的配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 打开~/.emacs.d/init.el
(global-set-key (kbd "<f2>") 'open-my-init-file)


;; provide会把特定的feature添加到features变量中去
(provide 'defun-fsz)
