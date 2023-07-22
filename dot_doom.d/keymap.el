(map! :n ";" 'evil-ex)
(map! :n "C-l" 'evil-force-normal-state)
(map! :n "C-q" 'consult-recent-file)
(map! :n "gp" 'flycheck-previous-error)
(map! :n "gn" 'flycheck-next-error)
(map! :n "gm" '+evil/next-beginning-of-method)
(map! :n "gM" '+evil/previous-beginning-of-method)
(map! :n "ga" 'embark-act)
(map! :n "s-w" 'evil-delete-buffer)
(map! :n "s-F" 'consult-line-multi)

(map! :ie "C-h" #'backward-delete-char-untabify)

(map! (:map (minibuffer-local-map
             minibuffer-local-ns-map
             minibuffer-local-completion-map
             minibuffer-local-must-match-map
             minibuffer-local-isearch-map
             read-expression-map)
       "C-h" #'backward-delete-char-untabify)

      (:after evil
       :map evil-ex-completion-map
       "C-h" #'backward-delete-char-untabify)

      (:after evil-org
       :map evil-org-mode-map :i "C-h" #'backward-delete-char-untabify)

      (:after vertico
       :map vertico-map
       "C-h" #'backward-delete-char-untabify))

(map! :n "s" 'avy-goto-char-2-below)
(map! :n "S" 'avy-goto-char-2-above)

(setq avy-keys (number-sequence ?a ?z))

(evil-ex-define-cmd "b" 'consult-buffer)
(evil-ex-define-cmd "s" 'consult-line)

(require 'recentf)
;; NOTE exclude path from recentf
(add-to-list 'recentf-exclude "/private/var/folders/.*")
(add-to-list 'recentf-exclude "/usr/local/Cellar/emacs-mac/.*")
(add-to-list 'recentf-exclude "/Users/ruizhang/.config/emacs/.local/etc/workspaces/*")

(defun insert-current-month ()
  (interactive)
  (insert (format-time-string "[%Y-%m]") (current-time)))

;; <leader>
(map! :leader
      ;; NOTE switch behavior of these two keys
      :desc "Pop up scratch buffer" "X"    #'doom/open-scratch-buffer
      :desc "Org Capture"           "x"    #'org-capture
      :desc "roam rg" "r" #'org-roam-rg-search
      )

