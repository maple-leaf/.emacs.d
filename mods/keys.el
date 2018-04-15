;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<ctrl>]") 'open-init-file)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
    "f f" 'counsel-find-file
    ":" 'counsel-M-x

    ; search and replace
    "s" 'swiper

    "t" 'multi-term

    ; project
    "p p" 'counsel-projectile-switch-project
    "p f" 'counsel-projectile-find-file
    "p r" 'counsel-projectile-find-file
    "RET" 'counsel-projectile-switch-to-buffer
    "/" 'counsel-projectile-ag

    ; evil window
    "w o" 'delete-other-windows
    "w j" 'evil-window-down
    "w k" 'evil-window-up
    "w l" 'evil-window-left
    ; TODO split and jump to
    "w h" 'evil-window-right
    "w /" 'evil-window-split
    "w v" 'evil-window-vsplit
    "w d" 'evil-window-delete
    "w TAB" 'spacemaces/alternate-window

    ; magit
    "g s" 'magit-status
 )

(provide 'keys)
