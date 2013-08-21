(require 'sr-speedbar)
(sr-speedbar-refresh-turn-off)

(define-key evil-normal-state-map "\d" (lambda () (interactive) (progn (sr-speedbar-toggle) (sr-speedbar-select-window) (linum-mode 0))))
(define-key speedbar-mode-map "\d" 'sr-speedbar-toggle)
