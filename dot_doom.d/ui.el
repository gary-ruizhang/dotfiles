;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; (add-to-list 'custom-theme-load-path "~/.doom.d/themes/")
(load-theme 'catppuccin t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(setq doom-font (font-spec :family "MonoLisa Static-Script" :size 20))
;; sometimes no need to see which key
;; (setq which-key-idle-delay 0.3)

;; TODO resize window
;; (set-frame-parameter nil 'undecorated t)
;; (setq initial-frame-alist '((top . 1) (left . 1) (width . 143) (height . 55)))

;; TODO remove title bar and maximum window on start with a top margin
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)

;; Minimal UI
;; org-modern
(package-initialize)

(setq desktop-restore-forces-onscreen nil)

;; Choose some fonts
;; (set-face-attribute 'org-modern-symbol nil :family "Iosevka")

(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-fold-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────")

(setq org-startup-with-inline-images t)

(global-org-modern-mode)
