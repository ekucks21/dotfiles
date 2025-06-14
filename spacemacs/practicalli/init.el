;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
   dotspacemacs-enable-lazy-installation nil

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;;
     ;; Layers added in alphabetic order

     ;; Add tool tips to show doc string of functions
     ;; Show snippets in the auto-completion popup
     ;; Show suggestions by most commonly used
     (auto-completion :variables
                      auto-completion-enable-help-tooltip "manual"
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-idle-delay 0.0
                      auto-completion-minimum-prefix-length 1
                      ;; auto-completion-complete-with-key-sequence "fd"
                      )

     ;; https://develop.spacemacs.org/layers/+lang/clojure/README.html
     (clojure :variables
              ;; clojure-backend 'cider                 ; use cider and disable lsp
              clojure-enable-kaocha-runner t            ; enable Kaocha test runner
              cider-repl-display-help-banner nil        ; disable help banner
              cider-print-fn 'puget                     ; pretty printing with sorted keys / set values
              clojure-indent-style 'align-arguments
              clojure-align-forms-automatically t
              clojure-toplevel-inside-comment-form t ; clashes with LSP
              cider-result-overlay-position 'at-point   ; results shown right after expression
              cider-overlays-use-font-lock t
              cider-repl-buffer-size-limit 100          ; limit lines shown in REPL buffer
              nrepl-use-ssh-fallback-for-remote-hosts t ; connect via ssh to remote hosts
              )

     ;; Nyan cat indicating relative position in current buffer
     ;; :variables colors-enable-nyan-cat-progress-bar (display-graphic-p)
     colors

     ;; SPC a L displays key and command history in a separate buffer
     command-log

     ;; Tools to work with comma separate values e.g. data science data
     ;; https://develop.spacemacs.org/layers/+lang/csv/README.html
     csv

     ;; Dockerfile LSP and docker container management
     (docker :variables
             docker-dockerfile-backend 'lsp)

     ;; For Spacemacs configuration files and packages
     emacs-lisp

     ;; Include emojis into everything
     emoji

     ;; SPC g s opens Magit git client full screen (q restores previous layout)
     ;; show word-granularity differences in current diff hunk
     ;; delta-plugin requires git-detlta install
     ;; https://develop.spacemacs.org/layers/+source-control/git/README.html#magit-plugins
     (git :variables
          git-magit-status-fullscreen t
          magit-diff-refine-hunk t
          git-enable-magit-todos-plugin t

          ;; Install https://github.com/dandavison/delta for language syntax highlights in diff
          ;; git-enable-magit-delta-plugin t
          )

     ;; graphviz - open-source graph declaration system
     ;; Used to generated graphs of Clojure project dependencies
     ;; https://develop.spacemacs.org/layers/+lang/graphviz/README.html
     graphviz

     ;; add variable `helm-follow-mode-persistent t' for helm-follow-mode sticky
     ;; helm follow mode previews when scrolling through a helm list
     ;; - remembers use of C-c C-f in helm pop-up
     ;; helm
     compleseus

     html
     javascript
     json

     ;; Language server protocol with minimal visual impact
     ;; https://practical.li/spacemacs/install-spacemacs/clojure-lsp/
     (lsp :variables
          lsp-file-watch-threshold 2000
          lsp-headerline-breadcrumb-enable t              ; Breadcrumb trail
          lsp-headerline-breadcrumb-segments '(symbols)   ; namespace & symbols, no file path
          lsp-ui-peek-enable nil                          ; popups for refs, errors, symbols, etc.
          lsp-semantic-tokens-enable t                    ; enhance syntax highlight
          lsp-treemacs-error-list-current-project-only t  ; limit errors to current project
          lsp-idle-delay 1.5                              ; smooth LSP features response
          lsp-eldoc-enable-hover nil                      ; disable all hover actions
          lsp-ui-doc-enable nil                           ; doc hover popups
          lsp-ui-sideline-enable nil                      ; sidebar code actions visual indicator
          treemacs-space-between-root-nodes nil           ; spacing in treemacs views
          lsp-log-io t                                    ; Log client-server json communication
          )

     markdown

     ;; Editing multiple lines of text concurrently
     ;; `g r' menu in Emacs normal state
     multiple-cursors

     ;; Spacemacs Org mode
     (org :variables
          org-enable-github-support t
          org-enable-bootstrap-support t
          ;; org-enable-reveal-js-support t
          org-want-todo-bindings t
          org-enable-org-journal-support t
          org-journal-dir "~/projects/journal/"
          org-journal-file-format "%Y-%m-%d"
          org-journal-date-prefix "#+TITLE: "
          org-journal-date-format "%A, %B %d %Y"
          org-journal-time-prefix "* "
          org-journal-time-format ""
          org-journal-carryover-items "TODO=\"TODO\"|TODO=\"DOING\"|TODO=\"BLOCKED\"|TODO=\"REVIEW\"")

     ;; Text-based file manager with preview - SPC a t r r
     (ranger :variables
             ranger-show-preview t
             ranger-show-hidden t
             ranger-cleanup-eagerly t
             ranger-cleanup-on-disable t
             ranger-ignored-extensions '("mkv" "flv" "iso" "mp4"))

     ;; SPC ' runs shell in a popup buffer
     (shell :variables
            shell-default-shell 'vterm
            shell-default-term-shell "/usr/bin/zsh"
            shell-default-height 30
            shell-default-position 'left)

     ;; spacemacs-layouts layer added to set variables
     ;; SPC TAB restricted to current layout buffers
     ;; Kill buffers when killing layer - SPC l x
     (spacemacs-layouts :variables
                        spacemacs-layouts-restrict-spc-tab t
                        persp-autokill-buffer-on-remove 'kill-weak)

     ;; Configuration: https://github.com/seagle0128/doom-modeline#customize
     (spacemacs-modeline :variables
                         doom-modeline-height 12
                         doom-modeline-bar-width 0                  ; size of bar icon at start of modeline
                         doom-modeline-buffer-state-icon t          ; disk icon for unsaved changes (default)
                         doom-modeline-major-mode-color-icon t      ; color icon of major mode
                         doom-modeline-buffer-file-name-style 'relative-to-project
                         doom-modeline-display-default-persp-name t ; layout name
                         doom-modeline-minor-modes nil              ; show minor modes
                         doom-modeline-modal nil                    ; show Evil state icon/text
                         ;; doom-modeline-modal-icon t              ; icon when t, ascii when nil
                         doom-modeline-buffer-encoding nil          ; remove UTF-8, etc.
                         )

     ;; Spell as you type with Flyspell package,
     ;; requires external command - ispell, hunspell, aspell
     ;; SPC S menu, SPC S s to check current word
     spell-checking

     ;; Use original flycheck fringe bitmaps
     ;; (syntax-checking :variables
     ;;                  syntax-checking-use-original-bitmaps t)

     ;; Visual file manager - `SPC p t'
     ;; treemacs-no-png-images t removes file and directory icons
     (treemacs :variables
               treemacs-indentation 1
               treemacs-use-filewatch-mode t
               treemacs-use-follow-mode t)

     ;; Support font ligatures (fancy symbols) in all modes
     ;; 'prog-mode for only programming languages
     ;; including text-mode may cause issues with org-mode and magit
     (unicode-fonts :variables
                    unicode-fonts-enable-ligatures t
                    unicode-fonts-ligature-modes '(prog-mode))

     ;; Highlight changes in buffers
     ;; SPC g . transient state for navigating changes
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)

     (yaml :variables
           yaml-enable-lsp t)

     ) ; End of dotspacemacs-configuration-layers


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      envrc
                                      powerline
                                      lispy
                                      (setenv-file :location (recipe :fetcher github :repo "cfclrk/setenv-file"))
                                      lispyville
                                      clojure-essential-ref
                                      (evil-surround
                                       :location
                                       (recipe :fetcher github
                                               :repo "emacs-evil/evil-surround"
                                               :commit "f273821f575ace519066fb106ee45a5b8577475f")))

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner (concat dotspacemacs-directory "banners/practicalli-logo.svg")

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable t

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         doom-gruvbox
                         doom-gruvbox-light
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("MesloLGS NF"
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scaleine-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:visual t
                                       :disabled-for-modes dired-mode
                                       doc-view-mode
                                       pdf-view-mode
                                       :size-limit-kb 1000)

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; Save `dotspacemacs/emacs-custom-settings' in a separate file
  ;; simplifying version control of the Spacemacs configuration file
  (setq custom-file (file-truename (concat dotspacemacs-directory "emacs-custom-settings.el")))
  (load custom-file)
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; dotspacemacs/user-config divided into files
  ;; - comment files to skip loading specific configuration

  ;; General configuration
  (setq user-config-file (file-truename (concat dotspacemacs-directory "user-config.el")))
  (load user-config-file)

  ;; Clojure Layer additionalb configuration
  (setq clojure-config-file (file-truename (concat dotspacemacs-directory "clojure-config.el")))
  (load clojure-config-file)

  ;; Customise Theme and Mode-line
  (setq theme-config-file (file-truename (concat dotspacemacs-directory "theme-config.el")))
  (load theme-config-file)

  ;; Version Control - Magit & Forge
  (setq version-control-config-file (file-truename (concat dotspacemacs-directory "version-control-config.el")))
  (load version-control-config-file)

  ;; Org-mode customisation - notes and tasks
  ;; (setq org-config-file (file-truename (concat dotspacemacs-directory "org-config.el")))
  ;; (load org-config-file)

  ;; EShell Customisation
  ;; NOTE: Practicalli uses vterm for shell by default
  ;; (setq eshell-config-file (file-truename (concat dotspacemacs-directory "eshell-config.el")))
  ;; (load eshell-config-file)

  ;; My stuff

  ;; dired
  (use-package dired
    :custom
    (dired-create-destination-dirs 'ask))

  ;; helm
  ;; (setq helm-ag-ignore-patterns '("cljs-out"))
  ;; (use-package helm-ag
  ;;   :config
  ;;   (setq helm-ag-use-grep-ignore-list nil))

  ;; clojure
  (with-eval-after-load "cider-inspector"
    (set-variable 'cider-lein-parameters "with-profile +dev repl")
    ;; (setq cider-clojure-cli-global-options nil)
    (define-key cider-inspector-mode-map
                (kbd "f") 'ace-link-cider-inspector))

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

  (add-hook 'cider-mode-hook
            (lambda ()
              (cider-load-file (expand-file-name "lispy-clojure.clj" lispy-site-directory))
              (cider-add-to-alist 'cider-jack-in-dependencies
                                  "clj-commons/pomegranate" "1.2.1")))

  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "tL" 'cider-test-rerun-test)
  (spacemacs/set-leader-keys-for-major-mode 'cider-repl-mode "tL" 'cider-test-rerun-test)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-repl-mode "tL" 'cider-test-rerun-test)

  ;; lsp clojure refactors
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "gg" 'lsp-find-definition)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "gd" 'lsp-find-declaration)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "gh" 'lsp-treemacs-call-hierarchy)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "gi" 'lsp-find-implementation)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "ge" 'lsp-treemacs-errors-list)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "gr" 'xref-find-references)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "Gg" 'lsp-ui-peek-find-definitions)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "Gr" 'lsp-ui-peek-find-references)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "Gi" 'lsp-ui-peek-find-implementation)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "Gs" 'lsp-ui-peek-find-workspace-symbol)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "hh" 'lsp-describe-thing-at-point)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "hg" 'lsp-ui-doc-glance)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "bd" 'lsp-describe-session)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "ram" 'lsp-clojure-add-missing-libspec)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "ran" 'lsp-clojure-add-import-to-namespace)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rcn" 'lsp-clojure-clean-ns)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rel" 'lsp-clojure-expand-let)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "ris" 'lsp-clojure-inline-symbol)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "ril" 'lsp-clojure-introduce-let)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rml" 'lsp-clojure-move-to-let)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "ref" 'lsp-clojure-extract-function)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rmf" 'lsp-clojure-move-form)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rtf" 'lsp-clojure-thread-first-all)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rttf" 'lsp-clojure-thread-first)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rttl" 'lsp-clojure-thread-last)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rtl" 'lsp-clojure-thread-last-all)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rua" 'lsp-clojure-unwind-all)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rut" 'lsp-clojure-unwind-thread)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rrs" 'lsp-rename)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rct" 'lsp-clojure-create-test)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rrm" 'lsp-clojure-resolve-macro-as)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "red" (lambda (def-name)
                                                                  (interactive "MDef name: ")
                                                                  (lsp-clojure--refactoring-call "extract-to-def" def-name)))
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rab" (lambda ()
                                                                  (interactive)
                                                                  (lsp-clojure--refactoring-call "drag-param-backward")))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",rab" "drag param backward")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "raf" (lambda ()
                                                                  (interactive)
                                                                  (lsp-clojure--refactoring-call "drag-param-forward")))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",raf" "drag param forward")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rdb" (lambda ()
                                                                  (interactive)
                                                                  (lsp-clojure--refactoring-call "drag-backward")))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",rdb" "drag backward")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rdf" (lambda ()
                                                                  (interactive)
                                                                  (lsp-clojure--refactoring-call "drag-forward")))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",rdf" "drag forward")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rof" (lambda ()
                                                                  (interactive)
                                                                  (lsp-clojure--refactoring-call "demote-fn")))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",rof" "demote function")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rdk" (lambda ()
                                                                  (interactive)
                                                                  (lsp-clojure--refactoring-call "destructure-keys")))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",rdk" "destructure keys")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rfe" (lambda ()
                                                                  (interactive)
                                                                  (lsp-clojure--refactoring-call "create-function")))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",rfe" "create function")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rpf" (lambda (fn-name)
                                                                  (interactive "MFn name: ")
                                                                  (lsp-clojure--refactoring-call "promote-fn" fn-name)))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",rpf" "promote function")
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rrr" (lambda ()
                                                                  (interactive)
                                                                  (lsp-clojure--refactoring-call "replace-refer-all-with-refer")))
  (which-key-add-major-mode-key-based-replacements 'clojure-mode ",rrr" "replace refer all with refer")

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

  ;; (add-hook 'lispy-mode
  ;;           (defhydra+ hydra-lispy-x ()
  ;;             ("M" lsp-clojure-move-to-let "move to let")
  ;;             ("E" cljr-expand-let "expand let")
  ;;             ("n" lsp-rename "rename symbol")
  ;;             ("f" cljr-inline-symbol "inline symbol")))

  (add-hook 'lsp-mode-hook (lambda ()
                             (require 'lsp-clojure)
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
                                  additional-motions
                                  additional-wrap
                                  c-u
                                  c-u
                                  c-w
                                  commentary
                                  escape
                                  mark-toggle
                                  operators
                                  prettify
                                  slurp/barf-lispy
                                  text-objects))))

  ;; lsp
  (spacemacs/set-leader-keys-for-major-mode 'lsp-mode "gj" 'consult-lsp-file-symbols)

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

  ;; magit
  (use-package magit
    :config
    (progn
      (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
      (transient-append-suffix 'magit-fetch "-t"
        '("-f" "Bypass safety checks" "--force"))))

  (setq-default evil-escape-delay 0.3)


  (setq setenv-file-dir (expand-file-name "~/creds/"))
  (setq magit-repository-directories '("~/sb/"))

  ;; airdex
  ;; (use-package airdex
  ;;   :ensure nil
  ;;   :load-path "/home/kuckse/sb/ata-aviation/lisp/"
  ;;   :custom
  ;;   airdex-cider-always-jack-in-at-root t)

  ;;term
  (setq comint-scroll-to-bottom-on-output "others")
  (setq term-scroll-to-bottom-on-output "others")
  (setq comint-move-point-for-output 'others)


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

  (use-package powerline)

  (use-package org
    :config
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "sH" 'org-do-promote))

  (use-package lsp
    :init
    (setq lsp-keymap-prefix ",")
    :config
    (define-key lsp-mode-map (kbd ",") lsp-command-map))

  (with-eval-after-load 'lsp-mode
    (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.devenv\\'"))

  (spacemacs/toggle-auto-fill-mode-off)
  (add-hook 'org-mode-hook #'(lambda () (visual-line-mode) (org-indent-mode)))
  (setq-default word-wrap t)
  (global-visual-line-mode t)

  (use-package evil-cleverparens
    :custom
    (evil-cleverparens-use-s-and-S nil))

  ;; (evil-global-set-key 'normal "/" 'consult-line)
  ;; (evil-global-set-key 'normal "/" 'evil-search-forward)
  (evil-global-set-key 'normal "f" 'evil-avy-goto-char-in-line)
  (evil-global-set-key 'normal "s" 'evil-avy-goto-char-2)
  (evil-global-set-key 'motion "s" 'evil-avy-goto-char-2)
  (define-key evil-normal-state-map (kbd "s") 'evil-avy-goto-char-2)

  ;; envrc
  (use-package envrc
    :config
    (envrc-global-mode 1))

  ;; misc
  (add-to-list 'recentf-exclude "/MEGA/")

  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

;; NOTE: `custom-set-variables` are now written to a separate file in the Spacemacs configuration location:
;; Uncomment and evaluate, `, e e', the expression below to check your location
;; (concat dotspacemacs-directory "emacs-custom-settings.el")
