;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; ------- Editor Config ---------
     osx
     auto-completion
     syntax-checking
     company-mode ; displays completion box
     ;; spell-checking
     ;; version-control

     ;; -------- Themes ---------
     themes-megapack
     ;; colors  ; colorize each identifier differently

     ;; -------- language support --------
     emacs-lisp
     markdown
     html
     erlang
     elixir
     git
     react
   )

   ;; List of additional packages that will be installed without layer 
   dotspacemacs-additional-packages '(base16-theme js2-mode)

   dotspacemacs-excluded-packages '()

   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))


(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-leader-key "SPC"
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native t
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-inactive-transparency 90
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-mode-line-unicode-symbols nil
   ;; themes
   dotspacemacs-themes '(base16-tomorrow-dark solarized-light) ; SPC T n to cycle
   line-spacing 3
   dotspacemacs-default-font '("Source Code Pro" :size 15 :weight normal :width normal :powerline-scale 1.1)
   ))


(defun dotspacemacs/user-init ()
  "Initialization function for user code"
  (setq ns-use-native-fullscreen nil) ; disable lion style fullscreen
  (tool-bar-mode -1) ; hides toolbar
  )


(defun dotspacemacs/user-config ()
  "Configuration function for user code."

  (my-personal-indents 2)
  (global-linum-mode nil) ; show line numbers by default
  (linum-relative-toggle) ; show relative numbers by default
  (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode)) ; make mode work with .js
  (setq-default js2-strict-trailing-comma-warning nil)
  (setq neo-show-hidden-files nil) ; hides hidden files by default in NeoTree
  (setq neo-hidden-regexp-list '(".DS_Store" ".tern-port" ".git/*" "node_modules/*" ".meteor/*"))
  ;; map snippet expansion to Ctrl Tab
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)
  )


(defun dotspacemacs/config ()
  (add-hook 'prog-mode-hook #'linum-mode)
  (add-hook 'prog-mode-hook #'linum-relative-toggle)
  (add-hook 'alchemist-mode-hook 'company-mode)
  )


(defun my-personal-indents (n)
  (setq indent-tabs-mode nil) ; use space instead of tab
  (setq c-basic-offset n)
  ;; web lang indents
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
