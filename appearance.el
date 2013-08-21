;; Make zooming affect frame instead of buffers
(require 'zoom-frm)

;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

;; Show line numbers
(global-linum-mode 1)

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(defun use-default-theme ()
  (interactive)
  (load-theme 'default-black)
  (when (boundp 'magnars/default-font)
    (set-face-attribute 'default nil :font magnars/default-font)))

(use-default-theme)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; org-mode colors
(setq org-todo-keyword-faces
      '(
        ("INPR" . (:foreground "yellow" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("IMPEDED" . (:foreground "red" :weight bold))
        ))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Scroll off
(setq scroll-margin 999
      scroll-conservatively 1000
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

