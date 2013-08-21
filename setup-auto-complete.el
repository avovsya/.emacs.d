;; (require 'auto-complete-config)
;; (ac-config-default)

;; ;; Slime
;; (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'slime-repl-mode))

(require 'auto-complete)

(setq ac-sources '(
                   ac-source-filename
                   ac-source-functions
                   ac-source-yasnippet
                   ac-source-variables
                   ac-source-symbols
                   ac-source-features
                   ac-source-words-in-same-mode-buffers
                   ac-source-css-property
                   ac-source-imenu
                   ))

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

(global-auto-complete-mode t)

;; JS2
;; (setq ac-js2-evaluate-calls t)
