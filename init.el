(defun tangle-init ()
  (when (equal (buffer-file-name)
               (expand-file-name (concat user-emacs-directory "init.org")))
    (let ((prog-mode-hook nil))
      (org-babel-tangle)
      (byte-compile-file (concat user-emacs-directory "init.el")))))
(add-hook 'after-save-hook 'tangle-init)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")t)
(package-initialize)
(package-refresh-contents)

; Set simple clip
(global-set-key (kbd "C-c C")
 (lambda ()
 (interactive)
  (simpleclip-copy)))
(global-set-key (kbd "C-c V")
 (lambda ()
 (interactive)
  (simpleclip-paste)))
; Go to personal dir
(global-set-key (kbd "C-c l")
 (lambda ()
 (interactive)
  (dired "~/Documents/life")))
; Quick set to Music dir
(global-set-key (kbd "C-c m")
 (lambda ()
 (interactive)
  (dired "~/Media/Music")))
; Quick previous buffer
(global-set-key (kbd "C-c b")
 (lambda ()
 (interactive)
 (previous-buffer)))
; Quick next buffer
(global-set-key (kbd "C-c f")
 (lambda ()
 (interactive)
 (next-buffer)))
; Quick toggle buffer
(global-set-key (kbd "C-c t")
 (lambda ()
 (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1))))
; Man pages
(global-set-key (kbd "C-c M")
 (lambda ()
 (interactive)
  (woman)))
; Get date and time
(global-set-key (kbd "C-c d")
 (lambda ()
 (interactive)
  (message (replace-regexp-in-string "\n$" ""
  (shell-command-to-string "date +'%m-%d-%y|%H:%M'")))))
; Recompile
(global-set-key (kbd "C-c c")
 (lambda ()
 (interactive)
  (save-buffer)
  (recompile)))
; Switch buffer
(global-set-key (kbd "C-c b")
  (lambda ()
  (interactive)
    (previous-buffer)))
; Revert buffer
(global-set-key (kbd "C-c r")
 (lambda ()
 (interactive)
  (revert-buffer)))
; Switch to shell buffer
(global-set-key (kbd "C-c s")
 (lambda ()
 (interactive)
  (switch-to-buffer "*shell*")))
; Go to org-agenda
(global-set-key (kbd "C-c a")
 (lambda ()
 (interactive)
  (org-agenda)))
; Quick shell buff switch
(global-set-key (kbd "C-c x")
 (lambda ()
 (interactive)
  (shell-command (read-from-minibuffer "run: "))))

; Emacs startup hook
(add-hook `emacs-startup-hook
  (lambda ()
    (erase-buffer)
    (shell)
    (switch-to-buffer "*scratch*")
    (delete-other-windows)
    (global-company-mode)))
; Save Hook deleting trailing whitespace
(add-hook 'after-save-hook
 (lambda ()
  (delete-trailing-whitespace)))
; Kill compilation buff and win if succesful
(add-hook 'compilation-finish-functions
 (lambda (buf str)
  (if (null (string-match ".*exited abnormally.*" str))
   (kill-buffer-and-window))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq-default c-basic-offset 2)
(setq c-basic-offset 2)
(setq-default tab-width 2)
(setq-default c-basic-indent 2)
(setq-default pythone-indent 2)
(setq-default pythone-indent-offset 2)

(global-visual-line-mode t)
(setq-default line-spacing 0)
(global-visual-line-mode 1)
(setq-default frame-title-format "%b (%f)")

(custom-set-faces
 `(company-tooltip ((t (:inherit default :background "#BF55EC"))))
 `(company-scrollbar-bg ((t (:background "#220066"))))
 `(company-scrollbar-fg ((t (:background "#BF55EC"))))
 `(company-tooltip-selection ((t (:background "#663399"))))
 `(company-tooltip-common ((t (:background "#775599")))))

(set-face-foreground 'mode-line "white")
(set-face-background 'mode-line "#BF55EC")
(setq-default mode-line-format (list
  "<%b|%+>"
  "<%m>"
  "<%o|L:%l>"
))

(when (display-graphic-p)
 ; Modeline
 (custom-set-faces
  '(info-title-3 ((t (:inherit info-title-4 :foreground "white" :background "#BF55EC" :height 1.2))))
  '(info-title-4 ((t (:inherit info-title-4 :foreground "white" :background "#663399"))))
  '(mode-line ((t (:foreground "#FFFFFF" :background "#663399" :box nil))))
  '(mode-line-inactive ((t (:foreground "#FFFFFF" :background "#441177" :box nil))))
 )
 (setq-default mode-line-format (list
  '(:eval (propertize (concat " %b|%+ ") 'face '(info-title-3) 'help-echo (buffer-file-name)))
  '(:eval (propertize (concat " %m ") 'face '(info-title-4) 'help-echo (buffer-file-name)))
  '(:eval (propertize (concat " %o|L:%l ") 'face '(info-title-3) 'help-echo (buffer-file-name)))
  '(:eval (propertize (- (+ right right-fring right-margin, + 3 (string-width mode-name)))))
 ))
 ; Set fg/bg color
 (set-foreground-color "white")
 (set-background-color "grey25")
 ; Dim inactive windows
 (auto-dim-other-buffers-mode t)
 ; Turn off bell
 (setq visible-bell t)
 ; Set font
 (set-frame-font "inconsolata-11" nil t)
 ; Remove key
 (global-unset-key (kbd "C-z")))

(server-start)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))
(defvar autosave-dir (concat "~/.emacs.d/saves" "/"))

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(setq org-todo-keywords '(
 "TODO"
 "CURRENT"
 "TOSTART"
 "PAUSED"
 "BACKLOG"
 "WAITING"
 "|"
 "DONE"
 "CANCELLED"))
(setq org-agenda-files '("~/Documents/life/todo.org"))

(setq view-diary-entries-initially t
  mark-diary-entries-in-calender t
  number-of-diary-entries 100)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calander-hook 'calander-mark-today)
