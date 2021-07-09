(defun tangle-init ()
  (when (equal (buffer-file-name)
               (expand-file-name (concat user-emacs-directory "init.org")))
    (let ((prog-mode-hook nil))
      (org-babel-tangle)
      (byte-compile-file (concat user-emacs-directory "init.el")))))
(add-hook 'after-save-hook 'tangle-init)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/load")
(setq package-check-signature nil)
(setq use-package-verbose nil)
(setq package-enable-at-startup t)
(package-initialize t)

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
; Recompile
(global-set-key (kbd "C-c c")
 (lambda ()
 (interactive)
  (save-buffer)
  (recompile)))
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
; Go to org dir
(global-set-key (kbd "C-c o")
 (lambda ()
 (interactive)
  (dired "~/Documents/org")))
; Go to org-agenda
(global-set-key (kbd "C-c a")
 (lambda ()
 (interactive)
  (org-agenda)))
; Quick shell buff switch
(global-set-key (kbd "C-c x")
 (lambda ()
 (interactive)
  (shell-command (read-from-minibuffer "exec: "))))

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
; Dired hook
(add-hook 'dired-mode-hook
  (lambda ()
    'dired-hide-details-mode))
; Org hook
(add-hook 'org-mode-hook
  (lambda ()
    (valign-mode)
    (setq-default fill-column 80)))
; Prog hook
(add-hook 'prog-mode-hook
  'rainbow-mode)

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
 `(company-tooltip-common ((t (:background "#775599"))))
)

; Modeline
(custom-set-faces
 '(info-title-3 ((t (:foreground "#000000" :background "#990099"))))
 '(info-title-4 ((t (:foreground "#FFFFFF" :background "#000000"))))
 '(info-title-1 ((t (:foreground "#990099" :background "#000000"))))
 '(info-title-2 ((t (:foreground "#000000" :background "#990099"))))
 '(info-xref ((t (:foreground "#990099" :background "#000000"))))
 '(mode-line ((t (:foreground "#FFFFFF" :background "#000000"))))
 '(mode-line-inactive ((t (:foreground "#FFFFFF" :background "#000000"))))
)
(setq-default mode-line-format (list
 '(:eval (propertize (concat " %b|%+ ") 'face '(info-title-3)))
 '(:eval (propertize (concat "") 'face '(info-title-1)))
 '(:eval (propertize (concat " %m ") 'face '(info-title-4)))
 '(:eval (propertize (concat "") 'face '(info-title-2)))
 '(:eval (propertize (concat " %o|L:%l ") 'face '(info-title-3)))
 '(:eval (propertize (concat "") 'face '(info-xref)))
))
; Turn off bell
(setq visible-bell t)
; Set font
(set-frame-font "inconsolata-11" nil t)

(when (display-graphic-p)
 ; Modeline
 (set-face-foreground 'mode-line "#FFFFFF")
 (set-face-background 'mode-line "#000000")
 (custom-set-faces
  '(info-title-3 ((t (:foreground "#FFFFFF" :background "#663399"))))
  '(info-title-4 ((t (:foreground "#FFFFFF" :background "#AA88EE"))))
  '(info-title-1 ((t (:foreground "#663399" :background "#AA88EE"))))
  '(info-title-2 ((t (:foreground "#AA88EE" :background "#663399"))))
  '(info-xref ((t (:foreground "#663399" :background "#000000"))))
  '(info-xref-visited ((t (:foreground "#AA88EE" :background "#000000"))))
  '(mode-line ((t (:foreground "#FFFFFF" :background "#000000" :box nil :height 1.1))))
  '(mode-line-inactive ((t (:foreground "#FFFFFF" :background "#000000" :box nil :height .85))))
  '(auto-dim-other-buffers-face ((t (:foreground "#FFFFFF" :background "#111111" :box nil))))
 )
 (setq-default mode-line-format (list
  '(:eval (propertize (concat " %b|%+ ") 'face '(info-title-3)))
  '(:eval (propertize (concat "") 'face '(info-title-1)))
  '(:eval (propertize (concat " %m ") 'face '(info-title-4)))
  '(:eval (propertize (concat "") 'face '(info-title-2)))
  '(:eval (propertize (concat " %o|L:%l ") 'face '(info-title-3)))
  '(:eval (propertize (concat "") 'face '(info-xref)))
 ))
 ; Set fg/bg color
 (set-foreground-color "#FFFFFF")
 (set-background-color "#222222")
 ; Opacity
 (set-frame-parameter (selected-frame) 'alpha '(85 . 85))
 (add-to-list 'default-frame-alist '(alpha . (85 . 85)))
 ; Dim inactive windows
 (auto-dim-other-buffers-mode t)
 ; Turn off bell
 (setq visible-bell t)
 ; Set font
 (set-frame-font "inconsolata-11" nil t)
 ; Remove key
 (global-unset-key (kbd "C-z"))
)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))
(defvar autosave-dir (concat "~/.emacs.d/saves" "/"))

(smartparens-global-mode)
(global-highlight-parentheses-mode t)
(custom-set-variables
  '(highlight-parentheses-background-colors '("#FFAAFF"))
  '(highlight-parentheses-colors
    '("#000000" "#FF11FF" "#BB11BB" "#991199" "#771187" "#661176" "#440154")))
(highlight-parentheses--color-update)

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
