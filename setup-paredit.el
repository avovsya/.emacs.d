(require 'paredit)
(require 'paredit-everywhere)
(add-hook 'prog-mode-hook 'paredit-everywhere-mode)
(add-hook 'paredit-mode-hook 'evil-paredit-mode)
