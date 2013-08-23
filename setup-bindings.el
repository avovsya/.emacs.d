(require 'evil)
(require 'evil-leader)
(require 'recentf)
(require 'defuns)

(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

(global-set-key (kbd "C-x n") 'find-file-in-project)

;; Regex search by default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Copy current file path to kill ring
(global-set-key (kbd "C-x M-w") 'copy-current-file-path)

;; Eshell
(global-set-key (kbd "C-x m") 'eshell)

;;; =============================================
;;; Evil Mode
;;; =============================================
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(define-key evil-normal-state-map "," nil)
(define-key evil-motion-state-map "," nil)
(evil-leader/set-leader ",")

;; I've bind "," to leader, so to search reverse with f, F, t and T
;; commands I'm using "\" symbol
(define-key evil-normal-state-map (kbd "\\") 'evil-repeat-find-char-reverse)

;; =============================================
;; Code
;; =============================================
(key-chord-define evil-insert-state-map "ii" 'ido-imenu-anywhere)
(key-chord-define evil-normal-state-map "ii" 'ido-imenu-anywhere)
; (key-chord-define evil-insert-state-map "ii" 'imenu-anywhere)
; (key-chord-define evil-normal-state-map "ii" 'imenu-anywhere)

;; =============================================
;; Buffers and windows
;; =============================================
(evil-leader/set-key "h" 'prev-buffer-skip-mess)
(evil-leader/set-key "l" 'next-buffer-skip-mess)

(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "C-<tab>") 'quick-switch-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;;; Window management
(evil-leader/set-key "\\" 'split-right)

(evil-leader/set-key "|" 'split-left)

(evil-leader/set-key "-" 'split-down)

(evil-leader/set-key "_" 'split-up)

;; User C-w c instead
;; (evil-leader/set-key "w" 'delete-window)
(evil-leader/set-key "q" 'kill-this-buffer)

;; =============================================
;; Edit ("e" prefix)
;; =============================================
(evil-leader/set-key "es" 'create-scratch-buffer)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

(global-set-key (kbd "C-\>") 'indent-for-tab-command)
(global-set-key (kbd "C-\>") 'indent-for-tab-command)

(define-key evil-visual-state-map ">" 'shift-region-right)
(define-key evil-visual-state-map "<" 'shift-region-left)

;; Perform general cleanup
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c C-<return>") 'delete-blank-lines)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; Eval and replace anywhere
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; Eval buffer
(global-set-key (kbd "C-c v") 'eval-buffer)

;; =============================================
;; Visual ("g" prefix)
;; =============================================
(evil-leader/set-key "gw" 'toggle-truncate-lines)

;; ===============================================
;; Standart Emacs key bindings in evil insert Mode
;; ===============================================
;; I don't use Evil completion
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)

;; Yank, kill, delete
(define-key evil-insert-state-map (kbd "C-y") 'yank)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)
