;;(package-initialize)

;; 设置加载路径
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'functions-fsz)
(require 'packages-fsz)
(require 'ivy-fsz)
(require 'builtin-fsz)

(setq custom-file "~/.emacs.d/lisp/emacs-custom.el")
(load custom-file)
;; load 是按照FILENAME去load-path里找，优先找FILENAME.elc，没有的话再去找FILENAME.el，
;; load-file是直接按照文件的绝对路径和明确后缀来加载比如~/.emacs.d/init.el
