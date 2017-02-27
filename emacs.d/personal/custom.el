(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffer-face-mode-face (quote default))
 '(c-basic-offset 4)
 '(c-default-style
   (quote
    ((c-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(comint-input-ignoredups t)
 '(comint-move-point-for-output (quote this))
 '(comint-scroll-to-bottom-on-input (quote this))
 '(company-backends
   (quote
    (company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev)))
 '(csharp-mode-hook
   (quote
    ((lambda nil
       (c-set-offset
        (quote comment-intro)
        0)
       (subword-mode 1)
       (setq c-basic-offset 4)))))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ediff-merge-split-window-function (quote split-window-horizontally))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ff-ignore-include t)
 '(flycheck-clang-args (quote ("-ferror-limit=0")))
 '(flycheck-cppcheck-checks (quote ("style" "warning")))
 '(flycheck-cppcheck-inconclusive t)
 '(flycheck-disabled-checkers (quote (c/c++-gcc)))
 '(flycheck-python-mypy-executable "C:\\Program Files (x86)\\Python35-32\\Scripts\\mypy.bat")
 '(flycheck-python-pylint-executable "C:\\Program Files (x86)\\Python35-32\\Scripts\\pylint.exe")
 '(helm-buffer-max-length 30)
 '(imenu-auto-rescan t)
 '(inhibit-startup-screen t)
 '(ispell-dictionary "en_GB")
 '(multi-term-scroll-show-maximum-output t)
 '(multi-term-scroll-to-bottom-on-output t)
 '(org-agenda-files nil t)
 '(package-selected-packages
   (quote
    (multi-term magit-gerrit d-mode solarized-theme markdown-mode zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window)))
 '(prelude-clean-whitespace-on-save nil)
 '(prelude-whitespace t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "_git" ".vs" "$tf" "Debug" "Release")))
 '(scroll-preserve-screen-position nil)
 '(smerge-command-prefix "v")
 '(tab-width 4)
 '(whitespace-style (quote (face trailing tabs lines-tail empty))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-space ((t (:foreground "#586e75" :slant italic)))))

(load-theme 'solarized-dark)

;(setq prelude-whitespace nil)
(setq-default fill-column 80)
(setq-default whitespace-line-column 80)

(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key (kbd "<f5>") 'ff-find-other-file)
            (local-set-key (kbd "<f7>") 'recompile)
            (c-set-offset 'inline-open 0)
            (c-set-offset 'innamespace 0)
            (c-set-offset 'inextern-lang 0)
            (c-set-offset 'comment-intro 0)))

(add-hook 'csharp-mode-hook
          (lambda()
            (c-set-offset 'comment-intro 0)
            (c-set-offset 'inline-open 0)
            (c-set-offset 'comment-intro 0)
            (c-set-offset 'case-label 0)
            (c-set-offset 'statement-case-open 0)))

(add-hook 'prog-mode-hook
          (lambda ()
            (subword-mode 1)
            (setq indent-tabs-mode 'nil)
            (local-set-key (kbd "M-,") 'pop-tag-mark)))

(add-hook 'asm-mode-hook
          (lambda ()
            (setq indent-tabs-mode 'nil)))

(add-hook 'text-mode-hook
          (lambda ()
            (set-fill-column 72)))

(smartparens-strict-mode 0)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(require 'nyan-mode)
(nyan-mode 1)

(nyan-start-animation)
(setq-default nyan-bar-length 10)

(setq guru-warn-only nil)

;; Org mode

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
        ("p" "pacificfox" entry (file+headline "/mnt/users/cw00/org/todo.org" "PacificFox")
         "* TODO [#A] %?")
        )
      )

(define-key prelude-mode-map (kbd "C-c i") 'helm-imenu-anywhere)

;; Long term registers

(set-register ?c '(file . "~/.emacs.d/personal/custom.el"))
(set-register ?t '(file . "/mnt/users/cw00/org/todo.org"))
(set-register ?u '(file . "/mnt/users/cw00"))


(global-set-key (kbd "C-c j") 'avy-goto-char)
(global-set-key (kbd "C-c z") 'avy-zap-up-to-char-dwim)

(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-x C-c C-q") 'save-buffers-kill-terminal)

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))


(add-hook 'ediff-startup-hook
          (lambda ()
            (local-set-key (kbd"q") 'my-ediff-quit)))

(defun my-ediff-quit ()
  "If any of the ediff buffers have been modified, ask if changes
should be saved. Then quit ediff normally, without asking for
confirmation"
  (interactive)
  (ediff-barf-if-not-control-buffer)
  (let* ((buf-a ediff-buffer-A)
         (buf-b ediff-buffer-B)
         (buf-c ediff-buffer-C)
         (ctl-buf (current-buffer))
         (modified (remove-if-not 'buffer-modified-p
                                  (list buf-a buf-b buf-c))))
    (let ((save (if modified (yes-or-no-p "Save changes?")nil)))
      (loop for buf in modified do
            (progn
              (set-buffer buf)
              (if save
                  (save-buffer)
                (set-buffer-modified-p nil))))
      (set-buffer ctl-buf)
      (ediff-really-quit nil))))

;; (setq prelude-guru 'nil)


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
                   (insert "#endif")
                   (newline)
                   (previous-line 3)
                   (set-buffer-modified-p nil))))))


(defun mine-dired-do-command (command)
  "Run COMMAND on marked files. Any files not already open will be opened.
After this command has been run, any buffers it's modified will remain
open and unsaved."
  (interactive "CRun on marked files M-x ")
  (save-window-excursion
    (mapc (lambda (filename)
            (find-file filename)
            (call-interactively command))
          (dired-get-marked-files))))

(require 'magit-gerrit)

(setq-default magit-gerrit-ssh-creds "cw00@gerrit")
