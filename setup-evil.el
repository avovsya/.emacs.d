(require 'evil)
(require 'evil-paredit)
(require 'surround)
(require 'evil-leader)
(require 'key-chord)
(require 'imenu-anywhere)

;;; Defuns
(defun shift-region-right ()
  (interactive)
  (when (> (mark) (point))
    (exchange-point-and-mark))
  (evil-normal-state)
  (evil-shift-right (mark) (point))
  (evil-visual-restore))

(defun shift-region-left ()
  (interactive)
  (when (> (mark) (point))
    (exchange-point-and-mark))
  (evil-normal-state)
  (evil-shift-left (mark) (point))
  (evil-visual-restore))

;; Buffer navigation
(defun skip-buffer ()
  (interactive)
  (string-match "\*.*\*" (buffer-name)))

(defun next-buffer-skip-mess ()
  "Move to next(prev) buffer and skip *Messages* buffer"
  (interactive)
  (next-buffer)
  (when (skip-buffer)
    (next-buffer)))

(defun prev-buffer-skip-mess ()
  "Move to next(prev) buffer and skip *Messages* buffer"
  (interactive)
  (previous-buffer)
  (when (skip-buffer)
    (previous-buffer)))
;;; End defuns

(global-evil-leader-mode)
(evil-mode 1)
(global-surround-mode 1)
(key-chord-mode 1)
(add-hook 'paredit-mode-hook 'evil-paredit-mode)
(setq evil-default-cursor t)
