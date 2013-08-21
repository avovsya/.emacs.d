(setq inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime)
(slime-setup)

;; Swank js
;; http://www.idryman.org/blog/2013/03/23/installing-swank-dot-js/
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))
;; TODO need to copy this from https://raw.github.com/magnars/.emacs.d/master/setup-slime-js.el
;; (load-file "~/.emacs.d/setup-slime-js.el")
