(map! :n ";" 'evil-ex)
(map! :n "C-l" 'evil-force-normal-state)
(map! :n "C-u" 'universal-argument)
(map! :n "C-q" 'consult-recent-file)
;; NOTE emacs is not for coding, so flycheck error is not used that much
(map! :n "[e" 'flycheck-previous-error)
(map! :n "]e" 'flycheck-next-error)
(map! :n "gp" 'previous-error)
(map! :n "gn" 'next-error)
(map! :n "gm" '+evil/next-beginning-of-method)
(map! :n "gM" '+evil/previous-beginning-of-method)
(map! :n "gr" '+lookup/references)
(map! :n "s-w" 'evil-delete-buffer)
(map! :n "s-g" 'magit-status)
(map! :n "s-e" 'consult-buffer)
(map! :n "s-i" 'consult-imenu)
(map! :n "s-I" 'consult-imenu-multi)
(map! :n "s-F" 'consult-ripgrep)
(map! :n "C-." 'embark-act)
(map! :n "M-." 'embark-dwim)
(map! :n "s-z" 'delete-other-windows)

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
       "C-h" #'backward-delete-char-untabify
       "C-u" #'universal-argument))

(map! :n "s" 'avy-goto-char-2)

(setq avy-keys (number-sequence ?a ?z))

(evil-ex-define-cmd "b" 'consult-buffer)
(evil-ex-define-cmd "s" 'consult-line)

(require 'recentf)
;; NOTE exclude path from recentf
(add-to-list 'recentf-exclude "/private/var/folders/.*")
(add-to-list 'recentf-exclude "/usr/local/Cellar/emacs-mac/.*")
(add-to-list 'recentf-exclude "/Users/ruizhang/.config/emacs/*")
(add-to-list 'recentf-exclude "/Users/ruizhang/org-roam/daily/*")
(add-to-list 'recentf-exclude "/Users/ruizhang/org-roam/archives/*")
(add-to-list 'recentf-exclude "/Users/ruizhang/.rustup/*")

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

(defun execute-extended-command-with-initial-input (initial)
  (interactive)
  (minibuffer-with-setup-hook
      (lambda () (insert initial))
    (command-execute #'execute-extended-command)))

(map! "C-s" #'(lambda () (interactive) (execute-extended-command-with-initial-input "consult ")))

(fset 'goto-next-empty-line
   (kmacro [?/ ?^ ?$ return] 0 "%d"))

(fset 'goto-last-empty-line
   (kmacro [?? ?^ ?$ return] 0 "%d"))

(map! :n "}" 'goto-next-empty-line)
(map! :n "{" 'goto-last-empty-line)
(map! :v "}" 'goto-next-empty-line)
(map! :v "{" 'goto-last-empty-line)
