;; Turn off mouse interface early in startup to avoid momentary display
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Packages
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      paredit
                      paredit-everywhere
                      idle-highlight-mode
                      find-file-in-project
                      smex
                      ido-ubiquitous
                      magit
		      zoom-frm
                      imenu-anywhere
                      ido-vertical-mode
                      auto-complete
                      sr-speedbar
                      yasnippet

                      ;; language modes
                      slime
                      slime-repl
                      nodejs-repl

                      simple-httpd
                      skewer-mode
                      js2-mode
                      js2-refactor

                      ;; auto-complete
                      auto-complete
                      ;; ac-js2
                      ;; ac-slime

                      ;; Swank.js deps
                      ;; exec-path-from-shell
                      ;; js2-mode
                      ;; slime-js
                      ;; js2-refactor
                      ;; ac-slime

                      ;; evil mode
                      evil
                      evil-leader
                      evil-paredit
                      surround
                      key-chord)
  "A list of my packages")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-dir)

(defun eval-after-init (form)
  "Add `(lambda () FORM)' to `after-init-hook'.
  If Emacs has already finished initialization, also eval FORM immediately."
  (let ((func (list 'lambda nil form)))
    (add-hook 'after-init-hook func)
    (when after-init-time
      (eval form))))

;;; Basic setup
;; (kill-buffer "*scratch*")
(eval-after-init
 '(progn

    (load-file (concat user-emacs-directory "appearance.el"))

    (load-file (concat user-emacs-directory "defuns.el"))
    (load-file (concat user-emacs-directory "misc.el"))
    (load-file (concat user-emacs-directory "mac.el"))

    (mapc 'load (directory-files user-emacs-directory t "^setup-.*el$"))

    ;; You can keep system- or user-specific customizations here
    (setq system-config (concat user-emacs-directory system-name ".el")
          user-config (concat user-emacs-directory user-login-name ".el")
          user-dir (concat user-emacs-directory user-login-name))

    (setq smex-save-file (concat user-emacs-directory ".smex-items"))
    (smex-initialize)
    (global-set-key (kbd "M-x") 'smex)

    ;; (progn
    ;;   (when (file-exists-p system-config) (load system-config))
    ;;   (when (file-exists-p user-config) (load user-config))
    ;;   (when (file-exists-p user-dir)
    ;;     (mapc 'load (directory-files user-dir t "^[^#].*el$"))))
))
