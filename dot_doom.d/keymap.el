(map! :n ";" 'evil-ex)
(map! :n "C-l" 'evil-force-normal-state)
(map! :n "C-u" 'universal-argument)
;; (map! :n "C-q" 'consult-recent-file)
;; NOTE emacs is not for coding, so flycheck error is not used that much
(map! :n "[e" 'flycheck-previous-error)
(map! :n "]e" 'flycheck-next-error)
(map! :n "gp" 'previous-error)
(map! :n "gn" 'next-error)
(map! :n "gm" '+evil/next-beginning-of-method)
(map! :n "gM" '+evil/previous-beginning-of-method)
(map! :n "gr" '+lookup/references)
(map! :n "s-w" 'evil-delete-buffer)
(map! :n "s-f" 'consult-ripgrep)
(map! :n "s-i" 'consult-imenu)
(map! :n "s-I" 'consult-imenu-multi)
(map! :n "C-." 'embark-act)
(map! :n "M-." 'embark-dwim)
(map! :n "C-z" 'delete-other-windows)

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

;; sort recentf-list by access time
(add-hook 'buffer-list-update-hook 'recentf-track-opened-file)

(defun consult-recent-file-by-access ()
  "Find recent file using `completing-read'."
  (interactive)
  (let ((recentf-list-cdr (cdr recentf-list)))
   (find-file
   (consult--read
    (or
     (mapcar #'consult--fast-abbreviate-file-name (bound-and-true-p recentf-list-cdr))
     (user-error "No recent files, `recentf-mode' is %s"
                 (if recentf-mode "enabled" "disabled")))
    :prompt "Find recent file: "
    :sort nil
    :require-match t
    :category 'file
    ;; no need preview for function
    ;; :state (consult--file-preview)
    :history 'file-name-history)))
  )

(map! (:after consult
       :n "C-q" #'consult-recent-file-by-access
              ))

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
