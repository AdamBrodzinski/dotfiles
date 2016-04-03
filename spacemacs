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
     ;; Uncomment some layer names and press <SPC f e R> (Vim style)
     auto-completion
     ;; better-defaults
     emacs-lisp
     markdown
     html
     osx
     ;; org
     colors
     editorconfig
     themes-megapack
     perspectives
     syntax-checking
     company-mode
     erlang
     elixir
     git
     dash
     editorsconfig
     react
     eyebrowse


     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(base16-theme js2-mode)
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; dotspacemacs-editing-style 'vim
   ;; dotspacemacs-verbose-loading nil
   ;; dotspacemacs-startup-banner 'official
   ;; dotspacemacs-startup-lists '(recents projects)
   ;;;; If non nil the cursor color matches the state color.
   ;; dotspacemacs-colorize-cursor-according-to-state t

   ;; Press <SPC> T n to cycle to the next theme in the list
   dotspacemacs-themes '(base16-tomorrow-dark solarized-light)

   line-spacing 3

   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; dotspacemacs-emacs-leader-key "M-m"
   ;; dotspacemacs-major-mode-leader-key ","
   ;; dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; dotspacemacs-command-key ":"
   ;; dotspacemacs-remap-Y-to-y$ t
   ;; dotspacemacs-helm-resize nil
   ;; dotspacemacs-helm-no-header nil
   ;; dotspacemacs-helm-position 'bottom
   ;; dotspacemacs-enable-paste-micro-state nil
   ;; dotspacemacs-auto-save-file-location 'cache
   ;; dotspacemacs-which-key-position 'bottom
   ;; dotspacemacs-loading-progress-bar t
   ;; dotspacemacs-smartparens-strict-mode nil
   ;; dotspacemacs-persistent-server nil
   ;; dotspacemacs-default-package-repository nil


   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil


   dotspacemacs-inactive-transparency 90

   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code."
  ;; JavaScript
  (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))
  ;; (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
  (setq js-indent-level 2)
  (setq-default js2-basic-offset 2)
  (setq-default js2-strict-trailing-comma-warning nil)
  )

(defun dotspacemacs/config ()
  (add-hook 'prog-mode-hook #'linum-mode)
  (add-hook 'prog-mode-hook #'linum-relative-toggle)
  (add-hook 'alchemist-mode-hook 'company-mode)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
