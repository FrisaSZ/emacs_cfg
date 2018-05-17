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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 删除插入修改文本
;; 从当前光标开始删除接下来的5个字符
(delete-char 5) 
(point)aa cb cc
;; 删除位置[a, b)范围内的文本，左开右闭
(delete-region 1167 1169)
;; 在当前光标位置插入字符串
(insert "current cursor")
;; 获取[a, b)的区域内的字符串，也是左开右闭的
(buffer-substring 1167 1169)
;; 将区域[a, b)范围内的文本改成首字母大写的形式
(capitalize-region 1167 1173)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 字符串操作
;; 返回字符串长度
(length "test abc")
;; 获取子串，左开右闭，索引从0开始
(substring "abcdefg" 3 5)
;; 字符串内的正则替换，replace-regexp-in-string a b c，把c中所有和a匹配的内容替换成b
(replace-regexp-in-string "[0-9]" "X" "abc123")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffer操作
;; 返回当前buffer名称
(buffer-name)
;; 返回当前文件的完整路径
(buffer-file-name)
;; 保存buffer即C-x C-s
(save-buffer)
;; 按buffer名称杀掉buffer
(kill-buffer "*Help*")
;; 在"xyz" buffer内执行一些操作，不太懂
(with-current-buffer "*scratch*"
  (print "print in message"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 文件操作
;; 打开文件相当于默认的C-x C-f，快捷键还会自动补一个目录等待回车，用命令则直接打开文件或文件夹了
(find-file "~/")

;; same as “Save As”.
(write-file path)

;; insert file into current position
(insert-file-contents path)

;; append a text block to file
(append-to-file start-pos end-pos path)

;; renaming file
(rename-file file-name new-name)

;; copying file
(copy-file old-name new-name)

;; deleting file
(delete-file file-name)

;; get dir path
(file-name-directory full-path)

;; get filename part
(file-name-nondirectory full-path)

;; get filename's suffix
(file-name-extension file-name)

;; get filename sans suffix
(file-name-sans-extension file-name)
