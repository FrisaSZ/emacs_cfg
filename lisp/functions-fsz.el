;; 自定义的函数

;; 打开自己的配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 打开~/.emacs.d/init.el
(global-set-key (kbd "<f2> <f2>") 'open-my-init-file)

;; 切换显示行号
(defun toggle-linum-mode()
  (interactive)
  
  )



;; provide会把特定的feature添加到features变量中去
(provide 'functions-fsz)
