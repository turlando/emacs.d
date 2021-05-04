;;; bahnhof-keys.el                                   -*- lexical-binding: t -*-

(defconst bahnhof-leader-key "SPC")
(defconst bahnhof-buffer-key "b")

(use-package hercules
  :demand)

(use-package general
  :demand)

(general-create-definer bahnhof-leader-def
  :states '(emacs normal motion insert visual hybrid operator)
  :prefix bahnhof-leader-key
  :keymaps 'override)

(bahnhof-leader-def
 "SPC" '(counsel-M-x :which-key "M-x"))

(general-create-definer bahnhof-buffer-def
  :wrapping bahnhof-leader-def
  :infix bahnhof-buffer-key
  :wk-full-keys nil
  "" '(:ignore t :which-key "buffer"))

(general-def
  :prefix-map 'bahnhof-buffer-flip-map
  "h" 'previous-buffer
  "j" 'next-buffer
  "k" 'previous-buffer
  "l" 'next-buffer)

(hercules-def
  :toggle-funs 'bahnhof-toggle-buffer-flip-mode
  :keymap 'bahnhof-buffer-flip-map
  :transient t)

(bahnhof-buffer-def
  "b" 'counsel-switch-buffer
  "f" '(bahnhof-toggle-buffer-flip-mode :which-key "flip")
  "n" 'next-buffer
  "p" 'previous-buffer
  "k" 'kill-buffer
  "d" 'kill-buffer-and-window)


(provide 'bahnhof-keys)
;;; bahnhof-keys.el ends here
