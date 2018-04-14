(package-initialize)
(add-to-list 'load-path "~/.emacs.d/mods")


(require 'emacs-config)


 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
                restart-emacs
                ;; --- Auto-completion ---
                company
                company-quickhelp
                ;; --- Better Editor ---
                hungry-delete
                counsel
                smartparens
                exec-path-from-shell

                ; search and replace
                swiper

                ; version control
                magit
                evil-magit

                ;; --- Themes ---
                solarized-theme
                monokai-theme

                ; project
                projectile
                counsel-projectile

                ; evil vim
                evil
                evil-leader


                ; web dev
                web-mode
                js2-mode
                js2-refactor
                nodejs-repl
                vue-mode
                typescript-mode

                ;; lsp
                lsp-mode
                company-lsp
                lsp-javascript-typescript
                lsp-vue
                ) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

; TODO config should be loaded after package
;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
         ("\\.html\\'" . web-mode))
       auto-mode-alist))


; evil
(global-evil-leader-mode)
(evil-mode 1)


; company mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2
            company-minimum-prefix-length 2
            company-require-match nil
            company-dabbrev-ignore-case nil
            company-dabbrev-downcase nil)
 (with-eval-after-load 'company
  (define-key company-active-map (kbd "C-j") (lambda () (interactive) (company-complete-common-or-cycle 1)))
  (define-key company-active-map (kbd "C-k") (lambda () (interactive) (company-complete-common-or-cycle -1))))

; projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action #'projectile-dired)


;; lsp-mode
(require 'lsp-typescript)
(add-hook 'js-mode-hook #'lsp-typescript-enable)
(add-hook 'typescript-mode-hook #'lsp-typescript-enable)
(add-hook 'js2-mode-hook #'lsp-typescript-enable)

(require 'company-lsp)
(push 'company-lsp company-backends)

; magit & magit-evil
(require 'evil-magit)
(add-hook 'magit-mode-hook 'evil-local-mode)
(add-hook 'git-rebase-mode-hook 'evil-local-mode)


(require 'helper)
(require 'package)
(require 'package-config)
(require 'ui)
(require 'keys)
