;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(require 'cl-lib)

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   ;; dotspacemacs-configuration-layer-path '("~/.mycontribs/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(graphviz
     systemd
     nginx
     php
     (java :variables java-backend 'lsp)
     autohotkey
     syntax-checking
     go
     javascript
     slack
     (terraform :variables terraform-backend 'lsp)
     rust
     typescript
     helpful
     python
     (conda :variables
            conda-anaconda-home "~/anaconda3/"
            conda-env-home-directory "~/anaconda3/"
            conda-env-autoactivate-mode t)
     conda
     csv
     ansible
     dap
     vimscript
     html
     haskell
     asciidoc
     markdown
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     terraform
     structurizr
     (clojure :variables
              clojure-enable-clj-refactor t
              ;; clojure-enable-linters 'clj-kondo
              clojure-align-forms-automatically t
              clojure-indent-style 'align-arguments
              clojure-align-reader-conditionals t
              cider-jdk-src-paths '("/usr/lib/jvm/openjdk-11/src.zip")
              )
     (lsp :variables
          ;; Formatting and indentation - use Cider instead
          lsp-enable-on-type-formatting nil
          ;; Set to nil to use CIDER features instead of LSP UI
          lsp-enable-indentation nil
          lsp-enable-snippet t ;; to test again

          ;; symbol highlighting - `lsp-toggle-symbol-highlight` toggles highlighting
          ;; subtle highlighting for doom-gruvbox-light theme defined in dotspacemacs/user-config
          lsp-enable-symbol-highlighting t

          ;; Show lint error indicator in the mode line
          lsp-modeline-diagnostics-enable t
          ;; lsp-modeline-diagnostics-scope :workspace

          lsp-remap-xref-keybindings t

          ;; popup documentation boxes
          ;; lsp-ui-doc-enable nil          ;; disable all doc popups
          lsp-ui-doc-show-with-cursor nil ;; doc popup for cursor
          lsp-ui-doc-show-with-mouse nil  ;; doc popup for mouse
          ;; lsp-ui-doc-delay 2                ;; delay in seconds for popup to display
          lsp-ui-doc-include-signature t ;; include function signature
          ;; lsp-ui-doc-position 'at-point  ;; top bottom at-point
          lsp-ui-doc-alignment 'window ;; frame window

          ;; code actions and diagnostics text as right-hand side of buffer
          lsp-ui-sideline-enable nil
          lsp-ui-sideline-show-code-actions nil
          ;; lsp-ui-sideline-delay 500

          ;; lsp-ui-sideline-show-diagnostics nil

          ;; reference count for functions (assume their maybe other lenses in future)
          lsp-lens-enable t

          ;; Efficient use of space in treemacs-lsp display
          treemacs-space-between-root-nodes nil

          ;; Optimization for large files
          lsp-file-watch-threshold 10000
          lsp-log-io nil)
     gnus
     (colors :variables colors-colorize-identifiers 'variables)
     docker
     (git :variables git-enable-magit-todos-plugin t)
     (yaml :variables
           yaml-enable-lsp t)
     ;; markdown
     org
     (shell :variables
            shell-default-shell 'vterm
            shell-default-term-shell "/bin/zsh"
            shell-default-height 30
            shell-default-position 'left)
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     sql
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      xclip
                                      org-contrib
                                      plantuml-mode
                                      sqlite3
                                      ob-http
                                      envrc
                                      lispy
                                      (setenv-file :location (recipe :fetcher github :repo "cfclrk/setenv-file"))
                                      table
                                      inf-mongo
                                      ;; org-modern
                                      lispyville
                                      inf-clojure
                                      edit-server
                                      soap-client
                                      docker-tramp
                                      edbi)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   dotspacemacs-line-numbers t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists nil
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("MesloLGS NF"
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scaleine-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-mode-line-theme 'spacemacs
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   paradox-github-token "b0c8b1fae2b441028497fd12991ece9918f161e9"
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq-default git-enable-magit-svn-plugin t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (xclip-mode 1)
  (spacemacs/toggle-auto-fill-mode-off)
  (setq magit-repository-directories '("~/sb/"))
  ;; (add-to-list 'tramp-default-proxies-alist
  ;;              '("\\." "\\`root\\'" "/ssh:%h:"))
  (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
  (setq projectile-switch-project-action 'projectile-vc)
  ;; (define-key lsp-mode-map (kbd "M-m l") lsp-command-map)
  ;; (spacemacs/declare-prefix-for-mode 'lsp-mode "lr" 'lsp-find-references)
  ;; (evil-define-key 'normal lsp-mode-map (kbd ", l") lsp-command-map)
  ;; (spacemacs/set-leader-keys-for-major-mode 'lsp-mode "l" 'lsp-command-map)
  ;; (spacemacs/set-leader-keys-for-major-mode 'lsp-mode "lr" 'lsp-find-references)
  (spacemacs/set-leader-keys "pA" 'helm-projectile-find-file-in-known-projects)
  (spacemacs|forall-clojure-modes m
    (spacemacs/set-leader-keys-for-major-mode m "gg" 'cider-find-var)
    (spacemacs/set-leader-keys-for-major-mode m "=i" 'indent-sexp)
    (spacemacs/set-leader-keys-for-major-mode m "ram" 'lsp-clojure-add-missing-libspec))
  (load "~/.emacs.d/.cache/quelpa/build/setenv-file/setenv-file.el")
  (setq setenv-file-dir (expand-file-name "~/creds/"))
  (setenv "JAVA_HOME" "/usr/lib/jvm/java-8-oracle")
  (setenv "PYTHON_EXECTUABLE" "~/anaconda3/envs/ribt/bin/python")
  (set-default 'eshell-visual-commands '("gradle", "watch"))
  ;; (add-to-list 'helm-ag-ignore-patterns "cljs-out")
  (require 'org-tempo)
  ;; For some reason this alias is no longer defined at startup and it's needed to get pasting to work
  (defalias 'second 'cadr)
  (envrc-global-mode)
  (setq comint-scroll-to-bottom-on-output "others")
  (setq term-scroll-to-bottom-on-output "others")
  (require 'org-tempo)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  ;; (with-eval-after-load 'gnus
  ;;   (setq gnus-secondary-select-methods
  ;;                             (nnimap "owa"
  ;;                                     (nnimap-address
  ;;                                      "localhost")
  ;;                                     (nnimap-server-port 1143))))
  (setq nnml-directory "~/owa")
  (setq helm-ag-base-command "ag --nocolor --nogroup -S")
  (setq message-directory "~/owa")



  (use-package plantuml-mode
    :custom
    (plantuml-default-exec-mode 'executable)
    (org-plantuml-exec-mode 'plantuml))

  (use-package ob
    :ensure nil
    :after plantuml-mode
    :hook (org-mode .
                    (lambda ()
                      (org-babel-do-load-languages 'org-babel-load-languages
                                                   '((plantuml . t))))))

  ;; evil
  (defun evil-paste-kbd-macro-advice (&rest argv)
    "make evil paste kbd-macro if register content is a macro.
  this function check whether content is a macro by:
  1. equal to `last-kbd-macro'
  2. is a vector but not string
  3. contain unprintable character"
    (if (and (>= (length argv) 2)
             (second argv))
        (let* ((register (second argv))
               (register-pair (assoc register register-alist))
               (content (if register-pair (cdr register-pair))))
          (if (and content
                   (or (eq last-kbd-macro content)
                       (vectorp content)
                       (string-match "[^\t[:print:]\n\r]" content)))
              (let ((last-kbd-macro content))
                (forward-line)
                (beginning-of-line)
                (insert-kbd-macro '##)
                (forward-line -2)
                (search-forward "setq last-kbd-macro")
                (replace-match "execute-kbd-macro")
                t)))))
  (advice-add 'evil-paste-after :before-until
              'evil-paste-kbd-macro-advice)

  ;; (use-package org-modern
  ;;   :config
  ;;   (add-hook 'org-mode-hook #'org-modern-mode)
  ;;   (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))

  ;; ob-http
  (use-package ob-http
    :config
    (add-to-list 'org-babel-load-languages
                 '(http . t)))

  ;; dired
  (use-package dired
    :custom
    (dired-create-destination-dirs 'ask))

  ;; helm
  (setq helm-ag-ignore-patterns '("cljs-out"))

  ;; cider
  (with-eval-after-load "cider-inspector"
    (set-variable 'cider-lein-parameters "with-profile +dev repl")
    ;; (setq cider-clojure-cli-global-options nil)
    (define-key cider-inspector-mode-map
      (kbd "f") 'ace-link-cider-inspector))
  ;; (with-eval-after-load 'clojure
  ;;   (setq cider-prompt-for-symbol nil))

  (use-package cider
    :config
    (progn
      (setq cider-prompt-for-symbol nil)))

  (add-hook 'clojure-mode-hook #'cider-mode)
  (add-hook 'cider-mode-hook
            (lambda ()
              (cider-load-file (expand-file-name "lispy-clojure.clj" lispy-site-directory))
              (cider-add-to-alist 'cider-jack-in-dependencies
                                  "clj-commons/pomegranate" "1.2.1")))
  (add-hook 'clojure-mode-hook
            (lambda ()
              (define-clojure-indent
                (prop/for-all '(1 ((:defn)) :form))
                (chuck/checking '(2 ((:defn)) :form))
                (async 1)
                (mfn/providing 1)
                (mfn/verifying 1)
                (rf/reg-event-fx 'defun)
                (rf/reg-event-db 'defun)
                (reg-event-db 'defun)
                (rf/reg-sub 'defun)
                (fn-traced 1)
                (defroutes 'defun)
                (cond-> 1)
                (cond->> 1)
                (as-> 2)
                (as->> 2)
                (tp/it-> 1)
                (GET 2)
                (POST 2)
                (PUT 2)
                (DELETE 2)
                (HEAD 2)
                (ANY 2)
                (OPTIONS 2)
                (PATCH 2)
                (rfn 2)
                (let-routes 1)
                (context 2)
                (describe 1)
                (beforeEach 1))))
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "tL" 'cider-test-rerun-test)
  (spacemacs/set-leader-keys-for-major-mode 'cider-repl-mode "tL" 'cider-test-rerun-test)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-repl-mode "tL" 'cider-test-rerun-test)

  
  ;; projectile
  ;; (add-hook 'projectile-mode-hook
  ;;           (lambda ()
  ;;             (nconc projectile-globally-ignored-directories '("cljs-out" ".clj-kondo"))))
  (with-eval-after-load 'projectile
    (setq projectile-indexing-method 'hybrid)
    (setq projectile-globally-ignored-directories
          (append '("cljs-out" ".clj-kondo") projectile-globally-ignored-directories))
    (defadvice projectile-project-root (around ignore-remote first activate)
      (unless (file-remote-p default-directory) ad-do-it)))

  ;; tramp
  (with-eval-after-load 'tramp
    (setq vc-handled-backends '(Git)))

  ;; recentf
  ;; (with-eval-after-load 'recentf
  ;;   (run-at-time (current-time) 300 'recentf-save-list))

  ;; lispy
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'clojure-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'clojure-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'inf-clojure-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'cider-repl-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'clojurescript-mode-hook (lambda () (lispy-mode 1)))
  ;; (add-hook 'cider-connected-hook #'lispy--clojure-middleware-load)
  (add-hook 'lispy-mode-hook (lambda ()
                               (add-to-list 'lispy-compat 'cider)
                               (evil-define-key 'insert lispy-mode-map (kbd "/")
                                 'special-lispy-splice)
                               (evil-define-key 'insert lispy-mode-map (kbd "C-k")
                                 'lispy-kill)
                               (evil-define-key 'insert lispy-mode-map (kbd "C-d")
                                 'lispy-delete)
                               (define-advice lispy-shifttab (:around (orig-func &rest args) fix)
                                 ;; restore the `org-overview' behaviour back to 9.1.9
                                 (let ((org-outline-regexp-bol (concat "^" outline-regexp)))
                                   (apply orig-func args)))
                               (setq lispy-visit-method "projectile")
                               (lispy-define-key lispy-mode-map-special "/" 'lispy-splice)
                               (lispy-define-key lispy-mode-map-special "i" 'indent-sexp)))
  (add-hook 'lsp-mode-hook (lambda ()
                             (require 'lsp-clojure)
                             (defhydra+ hydra-lispy-x ()
                               ("M" lsp-clojure-move-to-let "move to let")
                               ("E" cljr-expand-let "expand let")
                               ("n" lsp-rename "rename symbol")
                               ("f" cljr-inline-symbol "inline symbol"))
                             (when (eq major-mode 'clojure-mode)
                               (setq-local lsp-enable-indentation nil))
                             (define-key lispy-mode-map (kbd "M-n") 'lispy-mark-symbol)
                             (define-key lispy-mode-map (kbd "M-.")
                               (lambda ()
                                 (interactive)
                                 (if (bound-and-true-p lsp-mode)
                                     (lsp-find-definition)
                                   (jump-to-definition))))
                             (defun custom-lispy-eval ()
                               (interactive)
                               (if (bound-and-true-p lsp-mode)
                                   (cider-eval-sexp-at-point)
                                 (lispy-eval 1)))
                             (lispy-define-key lispy-mode-map-special "e" 'custom-lispy-eval)))
  (use-package lispyville
    ;; :init
    ;; (add-hook 'lispy-mode-hook #'lispyville-mode)
    :hook ((clojure-mode cider-repl-mode emacs-lisp-mode lisp-mode) .
           lispyville-mode)
    :config
    (progn
      (diminish 'lispyville-mode (lispyville-mode-line-string ":cake:" ":cake:"))
      (lispy-define-key lispy-mode-map "v" #'lispyville-toggle-mark-type)
      (lispyville-set-key-theme '(additional
                                  additional-insert
                                  additional-motions
                                  additional-wrap
                                  c-u
                                  c-w
                                  commentary
                                  escape
                                  mark-toggle
                                  operators
                                  prettify
                                  slurp/barf-lispy
                                  text-objects))))

  ;; emacs lisp
  (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "gr" 'xref-find-references)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rrs" 'cljr-rename-symbol)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "rrs" 'cljr-rename-symbol)

  ;; magit
  (use-package magit
    :config
    (progn
      (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
      (transient-append-suffix 'magit-fetch "-t"
        '("-f" "Bypass safety checks" "--force"))))

  ;; vterm
  (with-eval-after-load 'vterm
    ;; (evil-set-initial-state 'vterm-mode 'emacs)
    ;; (add-hook 'vterm-mode-hook
    ;;           (lambda ()
    ;;             (add-hook 'evil-insert-state-entry-hook
    ;;                       'evil-emacs-state
    ;;                       nil t)))
    (evil-collection-define-key 'normal 'vterm-mode-map "s" 'evil-avy-goto-char-2)
    (setq vterm-buffer-name-string "T: %s")
    (setq vterm-max-scrollback 100000)
    (evil-define-key 'emacs vterm-mode-map
      (kbd "C-c C-z") 'vterm-send-C-z)
    (add-to-list 'vterm-eval-cmds
                 '("find-files"
                   (lambda (&rest ARGS)
                     (mapcar 'find-file ARGS)))))

  ;; helm
  (setq helm-buffer-max-length nil)

  ;; ;; org
  ;; (with-eval-after-load 'org
  ;;   (org-agenda-file-to-front "~/MEGA/relationship"))

  ;; (add-hook 'magit-mode-hook (lambda () (turn-on-magit-gitflow)))
  (setq browse-url-browser-function 'browse-url-firefox)
  (setq Buffer-menu-name-width 40)
  ;; (global-linum-mode nil)
  ;; (evil-define-key 'normal vterm-mode-map
  ;;   (kbd "i") 'evil-emacs-state)
  ;; (evil-set-initial-state 'vterm-mode 'emacs)
  ;; (linum-relative-toggle)
  (setq org-export-with-sub-superscripts nil)
  (setq-default evil-escape-delay 0.3)
  (spaceline-toggle-hud-off)
  (setq eshell-buffer-shorthand nil)
  (setenv "PATH" (concat (getenv "PATH") ":/usr/lib/oracle/12.2/client64/bin"))
  (setq exec-path (append exec-path '("/usr/lib/oracle/12.2/client64/bin")))
  (setq evil-ex-visual-char-range t)
  (setq evil-want-minibuffer t)
  ;; (setq-default evil-escape-excluded-major-modes '(vterm-mode))

  ;; (define-key evil-normal-state-map (kbd "s") 'avy-goto-char-2)
  ;; (define-key evilem-map (kbd "s") 'evil-avy-goto-char-2)
  (evil-global-set-key 'normal "s" 'evil-avy-goto-char-2)
  (evil-global-set-key 'normal "f" 'evil-avy-goto-char-in-line)
  (evil-global-set-key 'motion "s" 'evil-avy-goto-char-2)
  (add-hook 'text-mode-hook #'visual-line-mode)
  (setq dotspacemacs-distinguish-gui-tab t)
  ;; (add-to-list 'evil-escape-excluded-major-modes 'vterm-mode)
  (setq password-cache t)
  (setq confluence-url "https://web1.pragmatics.com/jfwwiki/rpc/xmlrpc")
  (require 'ox-confluence)
  (setq org-latex-create-formula-image-program 'dvipng)
  (setq password-cache-expiry 3600)
  (setq comint-move-point-for-output 'others)
  (edit-server-start)
  (add-hook 'text-mode-hook (lambda () (smartparens-mode -1)) t)
  (defcustom sql-oracle-data-dictionary
    "select '(\"'||table_name||'\" \"'||column_name||'\")'
      from user_tab_columns 
      order by table_name;"
    "SQL Statement to determine all tables and columns."
    :group 'SQL
    :type 'string)
  (defun sql-oracle-data-dictionary ()
    (interactive)
    (setq sql-data-dictionary
          (sql-data-dictionary sql-oracle-data-dictionary)))
  (with-eval-after-load 'sql (setq sql-postgres-login-params (append sql-postgres-login-params '(port :default 5432))))
  (with-eval-after-load 'org (setq org-agenda-files (list "~/.org/job.org"))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "dev")
 '(cider-cljs-boot-repl
   "(do (require 'weasel.repl.websocket) (cemerick.piggieback/cljs-repl (weasel.repl.websocket/repl-env :ip \"127.0.0.1\" :port 9001)))")
 '(cider-cljs-lein-repl
   "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
 '(company-tooltip-common
   ((t
     (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection
   ((t
     (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(epa-file-cache-passphrase-for-symmetric-encryption t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "target" "out")))
 '(helm-ag-command-option " -U")
 '(helm-ag-use-agignore t)
 '(helm-ag-use-grep-ignore-list t)
 '(helm-boring-file-regexp-list
   (quote
    ("\\.hi$" "\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn/\\|\\.svn$" "\\.hg/\\|\\.hg$" "\\.git/\\|\\.git$" "\\.bzr/\\|\\.bzr$" "out/\\|out$" "target/\\|target$" "CVS/\\|CVS$" "_darcs/\\|_darcs$" "_MTN/\\|_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$")))
 '(magit-cherry-pick-arguments (quote ("-x")))
 '(magit-pull-arguments (quote ("--rebase")))
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (inf-mongo terraform-mode hcl-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode ahk-mode org-mime ghub let-alist sesman toml-mode tide typescript-mode racer pos-tip go-guru go-eldoc company-go go-mode cargo rust-mode robe bundler rvm ruby-tools ruby-test-mode rubocop rspec-mode rbenv rake minitest chruby inf-ruby nginx-mode web-beautify livid-mode skewer-mode simple-httpd js2-refactor js2-mode js-doc company-tern tern coffee-mode lispy zoutline swiper ivy powershell yapfify yaml-mode xterm-color ws-butler winum which-key web-mode volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill toc-org tagedit sqlplus sql-indent spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode psvn popwin plsql pip-requirements persp-mode pcre2el paradox orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-contrib org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint less-css-mode jinja2-mode jdee memoize intero flycheck info+ indent-guide hy-mode dash-functional hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav edit-server edbi epc ctable concurrent deferred dumb-jump dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish diff-hl define-word dactyl-mode cython-mode csv-mode confluence xml-rpc company-web web-completion-data company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company-ansible company-anaconda company column-enforce-mode cmm-mode clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed ansible-doc ansible anaconda-mode pythonic f dash s aggressive-indent adoc-mode markup-faces adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup)))
 '(paradox-automatically-star t)
 '(safe-local-variable-values
   (quote
    ((cider-cljs-lein-repl . "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "dev")
 '(cider-cljs-boot-repl
   "(do (require 'weasel.repl.websocket) (cemerick.piggieback/cljs-repl (weasel.repl.websocket/repl-env :ip \"127.0.0.1\" :port 9001)))")
 '(cider-cljs-lein-repl
   "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
 '(company-tooltip-common
   ((t
     (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection
   ((t
     (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(epa-file-cache-passphrase-for-symmetric-encryption t)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "target" "out"))
 '(helm-ag-command-option " -U")
 '(helm-ag-use-agignore t)
 '(helm-ag-use-grep-ignore-list t)
 '(helm-boring-file-regexp-list
   '("\\.hi$" "\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn/\\|\\.svn$" "\\.hg/\\|\\.hg$" "\\.git/\\|\\.git$" "\\.bzr/\\|\\.bzr$" "out/\\|out$" "target/\\|target$" "CVS/\\|CVS$" "_darcs/\\|_darcs$" "_MTN/\\|_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$"))
 '(helm-external-programs-associations '(("pdf" . "brave-browser-stable")))
 '(magit-cherry-pick-arguments '("-x"))
 '(magit-pull-arguments '("--rebase"))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(org-startup-truncated nil)
 '(package-selected-packages
   '(xclip inf-mongo terraform-mode hcl-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode ahk-mode org-mime ghub let-alist sesman toml-mode tide typescript-mode racer pos-tip go-guru go-eldoc company-go go-mode cargo rust-mode robe bundler rvm ruby-tools ruby-test-mode rubocop rspec-mode rbenv rake minitest chruby inf-ruby nginx-mode web-beautify livid-mode skewer-mode simple-httpd js2-refactor js2-mode js-doc company-tern tern coffee-mode lispy zoutline swiper ivy powershell yapfify yaml-mode xterm-color ws-butler winum which-key web-mode volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill toc-org tagedit sqlplus sql-indent spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode psvn popwin plsql pip-requirements persp-mode pcre2el paradox orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-contrib org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint less-css-mode jinja2-mode jdee memoize intero flycheck info+ indent-guide hy-mode dash-functional hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav edit-server edbi epc ctable concurrent deferred dumb-jump dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish diff-hl define-word dactyl-mode cython-mode csv-mode confluence xml-rpc company-web web-completion-data company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company-ansible company-anaconda company column-enforce-mode cmm-mode clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed ansible-doc ansible anaconda-mode pythonic f dash s aggressive-indent adoc-mode markup-faces adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))
 '(paradox-automatically-star t)
 '(safe-local-variable-values
   '((eval add-to-list 'auto-mode-alist
           '("Chart.lock$" . yaml-mode))
     (typescript-backend . tide)
     (typescript-backend . lsp)
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp)
     (cider-cljs-lein-repl . "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
