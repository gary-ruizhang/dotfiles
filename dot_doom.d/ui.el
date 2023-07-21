;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(setq doom-font (font-spec :family "OperatorMonoSSmLig Nerd Font Mono" :size 20))
;; sometimes no need to see which key
;; (setq which-key-idle-delay 0.3)

;; TODO resize window
;; (set-frame-parameter nil 'undecorated t)
;; (setq initial-frame-alist '((top . 1) (left . 1) (width . 143) (height . 55)))

;; TODO remove title bar and maximum window on start with a top margin
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)
