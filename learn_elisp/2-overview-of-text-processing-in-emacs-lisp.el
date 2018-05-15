;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 获取光标位置
;; point表示当前光标的位置
;; 用具体数字定位位置时，emacs中光标的位置也就是光标所覆盖的字符的位置(box)，
;; 或者光标位于其左侧的那个字符的位置(bar)，实际是位于当前字符左侧的。
;; buffer中第一个字符的位置是1，位于其上的光标位置也是1
(point)
;; 选中区域的开头和结尾的位置
(region-beginning)
(region-end)
;; 当前行的开头和结尾的位置
(line-beginning-position)
(line-end-position)
;; 当前buffer的开头和结尾的位置
(point-min)
(point-max)

(defun my-point()
  (interactive)
  (print (point)))
(defun my-line-end()
  (interactive)
  (print (line-end-position)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 移动光标位置
;; 移动光标到特定位置
(goto-char 39)
;; 光标向前向后移动特定距离
(forward-char 4)
(backward-char 4)
;; 光标移动到某个字符串的位置，并返回新的位置值
;; 前向搜索，最终光标位于这个字符串的末尾
(search-forward "some")
;; 后向搜索，最终光标位于这个字符串的开头
(search-backward "some")
;; 上面两个搜索的正则化版本
(re-search-forward "[0-9]")
(re-search-backward "[0-9]")
;; 略过光标，移动到首个不满足条件的字符位置，返回移动的距离
(skip-chars-forward "a-z")
(skip-chars-backward "a-z")
