(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-fundction-modifier 'hyper)

;; Ignore .DS_Store
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; keybinding to toggle full screen mode
(global-set-key (quote [M-f10]) (quote ns-toggle-fullscreen))

;; mac friendly font
(when window-system
  (setq magnars/default-font "-apple-Monaco-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")

  (setq magnars/presentation-font "-apple-Monaco-medium-normal-normal-*-28-*-*-*-m-0-iso10646-1")
  (set-face-attribute 'default nil :font magnars/default-font))
