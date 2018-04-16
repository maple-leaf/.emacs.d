; 禁止 Emacs 自动生成备份文件，例如 init.el~
(setq make-backup-files nil)
(setq auto-save-default nil)

; 当你选中一段文字 之后输入一个字符会替换掉你选中部分的文字。
(delete-selection-mode 1)

; use spaces instead of tabs when indenting
(setq-default indent-tabs-mode nil)

; 高亮当前行
(global-hl-line-mode 1)

(setq frame-title-format '((:eval default-directory)))

; code folding START
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'less-css-mode-hook 'hs-minor-mode)
(add-hook 'ssass-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook'hs-minor-mode)
(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'typescript-mode-hook 'hs-minor-mode)
(add-hook 'vue-mode-hook 'hs-minor-mode)
(add-hook 'web-mode-hook 'hs-minor-mode)
(add-hook 'elixir-mode-hook 'hs-minor-mode)
; code folding END

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
