;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Zhang Rui"
      user-mail-address "gary.ruizhang@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(display-time-mode 1)
(simpleclip-mode 1)

(add-hook 'window-setup-hook #'toggle-frame-fullscreen)
(setq doom-font (font-spec :family "OperatorMonoSSmLig Nerd Font" :size 20))
;; sometimes no need to see which key
;; (setq which-key-idle-delay 0.3)

(map! :n ";" 'evil-ex)
(map! :n "C-l" 'evil-force-normal-state)
(map! :n "gp" 'flycheck-previous-error)
(map! :n "gn" 'flycheck-next-error)
(map! :n "s-w" 'evil-delete-buffer)

;; NOTE remove snipe to make avy work
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)
(map! :n "s" 'avy-goto-char-2-below)
(map! :n "S" 'avy-goto-char-2-above)

(evil-ex-define-cmd "b" 'consult-buffer)
(evil-ex-define-cmd "s" 'consult-line)

;; <leader>
(map! :leader
      ;; NOTE switch behavior of these two keys
      :desc "Pop up scratch buffer" "X"    #'doom/open-scratch-buffer
      :desc "Org Capture"           "x"    #'org-capture
      ;; NOTE not use git in emacs, magit not impressive at all
      :desc "GTD" "g" (lambda() (interactive)(find-file "~/org/gtd/GTD.org"))
      :desc "roam rg" "r" #'org-roam-rg-search
      )

(after! company
   (map! :map company-active-map "<tab>" #'company-complete-selection)
   (map! :map company-active-map "RET" nil)
   (map! :map company-active-map "<return>" nil))

;; TODO organize all org specific config in here
(after! org
        ;; NOTE just one big GTD file to start
  (setq org-agenda-files (list "~/org/gtd/GTD.org")
        org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "PROJ(p)" "|" "DONE(d)" "KILL(k)"))
        ;; FIXME not work
        ;; org-todo-keywords-for-agenda '("TODO" "WAIT" "DONE" "KILL")
        +org-capture-todo-file "~/org/gtd/GTD.org"
        org-show-notification-handler 'message)
  )

(after! evil-org
  (map! :map evil-org-mode-map
        ;; NOTE otherwise these 2 shortcuts will do normal evil new line
        :n "C-<return>" '+org/insert-item-below
        :n "s-<return>" '+org/insert-item-below)
  )

;; TODO find a better way for tags
(defun org-roam-rg-search ()
  "Search org-roam directory using consult-ripgrep. With live-preview."
  (interactive)
  (let ((consult-ripgrep-command "rg --null --ignore-case --type org --line-buffered --color=always --max-columns=500 --no-heading --line-number . -e ARG OPTS"))
    (consult-ripgrep "/Users/ruizhang/org-roam/daily")))

;; NOTE should view agenda everywhere not just in org file
(map! :n
      ;; NOTE this shortcut original used to do attachment
      "C-c C-a" #'org-agenda)
(setq org-agenda-custom-commands '(("s" consult-org-agenda)))

(setq org-roam-directory "~/org-roam/notes")
;; NOTE below path is relative to above
(setq org-roam-dailies-directory "../daily/")
;; NOTE exclude daily files from org-roam search
(setq org-roam-file-exclude-regexp "/Users/ruizhang/org-roam/daily")
;; FIXME temporary fixes
(setq org-fold-core-style "overlays")
(setq rmh-elfeed-org-files '("~/org/elfeed.org"))
;; automatically updating feed when opening elfeed
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

(remove-hook 'undo-fu-mode-hook #'global-undo-fu-session-mode)
