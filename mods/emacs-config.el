; 禁止 Emacs 自动生成备份文件，例如 init.el~
(setq make-backup-files nil)
(setq auto-save-default nil)

; 当你选中一段文字 之后输入一个字符会替换掉你选中部分的文字。
(delete-selection-mode 1)

; 高亮当前行
(global-hl-line-mode 1)

(abbrev-mode t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

; melp and gnu package source
 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(provide 'emacs-config)
