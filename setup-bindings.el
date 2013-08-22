(require 'recentf)
(require 'defuns)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

;; Regex search by default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Perform general cleanup
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c C-<return>") 'delete-blank-lines)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "C-<tab>") 'quick-switch-buffer)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Copy current file path to kill ring
(global-set-key (kbd "C-x M-w") 'copy-current-file-path)

;; Eval and replace anywhere
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; Eval buffer
(global-set-key (kbd "C-c v") 'eval-buffer)

;; Eshell
(global-set-key (kbd "C-x m") 'eshell)

;;; Window management
(evil-leader/set-key "\\" 'split-right)

(evil-leader/set-key "|" 'split-left)

(evil-leader/set-key "-" 'split-down)

(evil-leader/set-key "_" 'split-up)

(evil-leader/set-key "w" 'delete-window)
(evil-leader/set-key "q" 'kill-this-buffer)

(evil-leader/set-key "r" 'rotate-windows)

;;; =============================================
;;; Evil Mode
;;; =============================================

(define-key evil-insert-state-map (kbd "C-h") 'left-char)
(define-key evil-insert-state-map (kbd "C-j") 'next-line)
(define-key evil-insert-state-map (kbd "C-k") 'previous-line)
(define-key evil-insert-state-map (kbd "C-l") 'right-char)
(define-key evil-insert-state-map (kbd "C-S-h k") 'describe-key)

(define-key evil-visual-state-map ">" 'shift-region-right)
(define-key evil-visual-state-map "<" 'shift-region-left)

(global-set-key (kbd "C-\>") 'indent-for-tab-command)

(define-key evil-normal-state-map "," nil)
(define-key evil-motion-state-map "," nil)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; (key-chord-define evil-insert-state-map "ii" 'imenu-anywhere)
;; (key-chord-define evil-normal-state-map "ii" 'imenu-anywhere)
(key-chord-define evil-insert-state-map "ii" 'ido-imenu)
(key-chord-define evil-normal-state-map "ii" 'ido-imenu)

(evil-leader/set-leader ",")
(evil-leader/set-key "l" 'next-buffer-skip-mess)
(evil-leader/set-key "h" 'prev-buffer-skip-mess)
(evil-leader/set-key "es" 'create-scratch-buffer)
(evil-leader/set-key "gw" 'toggle-truncate-lines)
