(defun tangle-init ()
  (when (equal (buffer-file-name)
               (expand-file-name (concat user-emacs-directory "init.org")))
    (let ((prog-mode-hook nil))
      (org-babel-tangle)
      (byte-compile-file (concat user-emacs-directory "init.el")))))
(add-hook 'after-save-hook 'tangle-init)

(custom-set-variables
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))))
(package-initialize)
(require 'package)

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

(add-hook `emacs-startup-hook
  (lambda ()
    (erase-buffer)
    (shell)
    (switch-to-buffer "*scratch*")
    (delete-other-windows)))

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

(set-face-foreground 'mode-line "white")
(set-face-background 'mode-line "#BF55EC")
(setq-default mode-line-format (list
  "<%b|%+>" 
  "<%m>" 
  "<%o|L:%l>"
 ))

(if (display-graphic-p)
 (progn
  (set-foreground-color "white")
  (set-background-color "grey25")
  (setq visible-bell t)))

(add-hook 'compilation-finish-functions
 (lambda (buf str)
  (if (null (string-match ".*exited abnormally.*" str))
   (kill-buffer-and-window))))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))
(defvar autosave-dir (concat "~/.emacs.d/saves" "/"))

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(setq org-todo-keywords
 '((sequence
  "TODO"
  "CURRENT"
  "TOSTART"
  "PAUSED"
  "BACKLOG"
  "|"
  "DONE"
  "CANCELLED")))

(setq view-diary-entries-initially t
  mark-diary-entries-in-calender t
  number-of-diary-entries 100)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calander-hook 'calander-mark-today)
