;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; 设置加载路径
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'defun-fsz)
(require 'packages-fsz)
(require 'ui-fsz)
(require 'defaults-fsz)

(setq custom-file "~/.emacs.d/lisp/emacs-custom.el")
(load custom-file)
;; load 是按照FILENAME去load-path里找，优先找FILENAME.elc，没有的话再去找FILENAME.el，
;; load-file是直接按照文件的绝对路径和明确后缀来加载比如~/.emacs.d/init.el
