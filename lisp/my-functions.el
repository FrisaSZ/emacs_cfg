;; 自定义的函数

;; 打开自己的配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; provide会把特定的feature添加到features变量中去
(provide 'my-functions)
