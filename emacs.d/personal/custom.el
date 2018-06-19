(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote ((".*" . "/tmp/cw00_emacs_backups"))))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(magit-rebase-arguments (quote ("--interactive")))
 '(package-selected-packages
   (quote
    (bitbake magit magit-gerrit csv-mode python-docstring sphinx-mode sphinx-doc avy-zap ggtags nyan-mode fill-column-indicator solarized solarized-dark markdown-mode zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window)))
 '(projectile-enable-caching t)
 '(shift-select-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(prelude-require-packages '(fill-column-indicator
                            magit-gerrit
                            visual-regexp
                            visual-regexp-steroids))

(setq scroll-preserve-screen-position 'nil
      prelude-clean-whitespace-on-save 'nil)

(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key (kbd "<f5>") 'ff-find-other-file)
            (local-set-key (kbd "<f7>") 'recompile)
            (c-set-offset 'inline-open 0)
            (c-set-offset 'innamespace 0)
            (c-set-offset 'inextern-lang 0)
            (c-set-offset 'comment-intro 0)
            (ggtags-mode 1)
            (smartparens-strict-mode 0)
            ))

(add-hook 'csharp-mode-hook
          (lambda()
            (c-set-offset 'comment-intro 0)
            (c-set-offset 'inline-open 0)
            (c-set-offset 'comment-intro 0)
            (c-set-offset 'case-label 0)
            (c-set-offset 'statement-case-open 0)))

(add-hook 'prog-mode-hook
          (lambda ()
            (set-fill-column 80)
            (subword-mode 1)
            (setq indent-tabs-mode 'nil
                  c-default-style '((c-mode . "stroustrup")
                                    (java-mode . "java")
                                    (awk-mode . "awk")
                                    (other . "gnu")))
            (local-set-key (kbd "M-,") 'pop-tag-mark)
          ; (fci-mode 1)
            ))

; Tab width of 4 everywhere
(setq-default tab-width 4)

; Set our dictionary to british english (there's no NZ?!)
(setq-default ispell-dictionary "en_GB")

(add-hook 'asm-mode-hook
          (lambda ()
            (setq indent-tabs-mode 'nil)))

(add-hook 'text-mode-hook
          (lambda ()
            (set-fill-column 72)))

(add-hook 'python-mode-hook
          (lambda ()
            (set-fill-column 79)  ; PEP8 demands 79 char
            (setq python-docstring-sentence-end-double-space 'nil
                  python-fill-docstring-style 'onetwo)
            (python-docstring-mode 1)
            ))

(setq guru-warn-only nil)

(global-set-key (kbd "C-c l") 'org-store-link)

(setq org-agenda-files (quote ("/mnt/users/cw00/org/todo.org")))

;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;;capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "/mnt/users/cw00/org/todo.org" "Tasks")
         "* TODO [#A] %?")
        )
      )

(set-register ?c '(file . "~/.emacs.d/personal/custom.el"))
(set-register ?t '(file . "/mnt/users/cw00/org/todo.org"))
(set-register ?u '(file . "/mnt/users/cw00"))

(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-x C-c C-q") 'save-buffers-kill-terminal)

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(setq auto-mode-alist
      (append '(("SConstruct" . python-mode)
                ("SConscript" . python-mode)
                ("*.scons" . python-mode))
              auto-mode-alist))

(require 'magit-gerrit)
(setq-default magit-gerrit-ssh-creds "cw00@gerrit")

(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

(define-key global-map (kbd "C-M-%") 'vr/query-replace)
(define-key global-map (kbd "C-M-r") 'vr/isearch-forward)
(define-key global-map (kbd "C-M-s") 'vr/isearch-backward)

(defun get-include-guard ()
  "Return a string suitable for use in a C/C++ include guard"
  (let* ((fname (buffer-file-name (current-buffer)))
         (fbasename (replace-regexp-in-string ".*/" "" fname))
         (inc-guard-base (replace-regexp-in-string "[.-]"
                                                   "_"
                                                   fbasename)))
    (concat (upcase inc-guard-base) "__")))

(add-hook 'find-file-not-found-hooks
          '(lambda ()
             (let ((file-name (buffer-file-name (current-buffer))))
               (when (string= ".h" (substring file-name -2))
                 (let ((include-guard (get-include-guard)))
                   (insert "#ifndef " include-guard)
                   (newline)
                   (insert "#define " include-guard)
                   (newline 4)
                   (insert "#endif /* " include-guard " */")
                   (newline)
                   (previous-line 3)
                   (set-buffer-modified-p nil))))))


(setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))


(global-set-key (kbd "C-c j") 'avy-goto-char)
(global-set-key (kbd "C-c z") 'avy-zap-up-to-char-dwim)
