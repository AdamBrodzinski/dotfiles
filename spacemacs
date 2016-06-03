;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
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

     ;; colors  ; colorize each identifier differently

     ;; -------- language support --------
     emacs-lisp
     markdown
     erlang
     elixir
     git
     react
     elm
     )
   ;; additional packages that will be installed without being wrapped in a layer
   dotspacemacs-additional-packages '(
     js2-mode
     atom-one-dark-theme
     color-theme-sanityinc-tomorrow
     )

   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-timeout 5

   ;; Press <SPC> T n to cycle or <Spc> T h to select from list
   dotspacemacs-themes '(sanityinc-tomorrow-night sanityinc-tomorrow-day)
   line-spacing 3
   dotspacemacs-default-font '("Source Code Pro" :size 14 :weight normal :width normal :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native t
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-inactive-transparency 90
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers "relative"
   dotspacemacs-whitespace-cleanup nil
   ))


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq ns-use-native-fullscreen nil) ; disable lion style fullscreen
  (tool-bar-mode -1) ; hides toolbar
  )


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."
  (linum-relative-toggle) ; show relative numbers by default

  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
  (add-to-list 'company-backends 'company-elm)
  (setq-default js2-strict-trailing-comma-warning nil)
  (add-to-list 'auto-mode-alist '("\\.exjs?\\'" . elixir-mode))

  (my-personal-indents 2)

  (setq neo-show-hidden-files nil) ; hides hidden files by default in NeoTree
  (setq neo-hidden-regexp-list '(".DS_Store" ".tern-port" ".git/*" "node_modules/*" ".meteor" "_build" "deps"))

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
  (setq web-mode-attr-indent-offset n)
  (setq css-indent-offset n) ; css-mode
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
