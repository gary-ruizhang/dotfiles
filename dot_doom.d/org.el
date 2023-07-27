;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

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

(use-package consult-org-roam
   :ensure t
   :after org-roam
   :init
   (require 'consult-org-roam)
   ;; Activate the minor mode
   (consult-org-roam-mode 1)
   :custom
   ;; Use `ripgrep' for searching with `consult-org-roam-search'
   (consult-org-roam-grep-func #'consult-ripgrep))

(defun my/hook (hook)
  "Create an org-link target string using `hook://` url scheme."
  (shell-command (concat "open hook:\"" hook "\"")))

  (org-add-link-type "hook" 'my/hook)
