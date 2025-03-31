;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-external-programs-associations '(("pdf" . "brave-browser")))
 '(package-selected-packages
   '(ace-jump-helm-line ace-link adoc-mode aggressive-indent ahk-mode all-the-icons
                        ansible ansible-doc attrap auto-compile auto-dictionary
                        auto-highlight-symbol auto-yasnippet blacken
                        browse-at-remote centered-cursor-mode cider-eval-sexp-fu
                        clean-aindent-mode clj-refactor clojure-essential-ref
                        clojure-snippets cmm-mode code-cells code-review
                        color-identifiers-mode column-enforce-mode
                        command-log-mode company-anaconda company-ansible
                        company-cabal company-emoji company-php company-phpactor
                        company-quickhelp company-statistics company-terraform
                        company-web compat compleseus-spacemacs-help conda
                        consult consult-lsp consult-yasnippet csv-mode
                        cython-mode dactyl-mode dante define-word devdocs
                        diff-hl diminish dired-quick-sort disable-mouse docker
                        dockerfile-mode doom-modeline doom-themes dotenv-mode
                        drag-stuff drupal-mode dumb-jump eat edbi edit-indirect
                        edit-server editorconfig elisp-def elisp-demos
                        elisp-slime-nav embark embark-consult emmet-mode
                        emoji-cheat-sheet-plus emr envrc esh-help
                        eshell-prompt-extras eshell-z evil-anzu evil-args
                        evil-cleverparens evil-collection evil-easymotion
                        evil-escape evil-evilified-state evil-exchange
                        evil-goggles evil-iedit-state evil-indent-plus evil-lion
                        evil-lisp-state evil-matchit evil-mc evil-nerd-commenter
                        evil-numbers evil-org evil-surround evil-textobj-line
                        evil-tutor evil-unimpaired evil-visual-mark-mode
                        evil-visualstar expand-region eyebrowse fancy-battery
                        flx-ido flycheck-elsa flycheck-haskell flycheck-package
                        flycheck-pos-tip flyspell-correct-helm
                        flyspell-correct-popup font-utils geben gh-md git-link
                        git-messenger git-modes git-timemachine
                        gitignore-templates gnuplot go-eldoc go-fill-struct
                        go-gen-test go-guru go-impl go-rename go-tag godoctor
                        golden-ratio google-translate graphviz-dot-mode
                        groovy-imports groovy-mode haskell-snippets helm-ag
                        helm-c-yasnippet helm-cider helm-comint helm-company
                        helm-css-scss helm-descbinds helm-git-grep helm-hoogle
                        helm-ls-git helm-lsp helm-make helm-mode-manager
                        helm-org helm-org-rifle helm-projectile helm-purpose
                        helm-pydoc helm-swoop helm-themes helm-xref helpful
                        hide-comnt highlight-indentation highlight-numbers
                        highlight-parentheses hindent hlint-refactor holy-mode
                        hungry-delete hybrid-mode impatient-mode importmagic
                        indent-guide inf-clojure inf-mongo info+ inspector
                        jinja2-mode journalctl-mode js-doc js2-refactor
                        json-mode json-navigator json-reformat kaocha-runner
                        keycast ligature link-hint lispyville live-py-mode
                        livid-mode lorem-ipsum lsp-haskell lsp-java lsp-origami
                        lsp-pyright lsp-ui macrostep magit-svn magit-todos
                        marginalia markdown-toc maven-test-mode monokai-theme
                        multi-line multi-term multi-vterm mvn mwim nameless
                        nerd-icons nginx-mode nodejs-repl npm-mode nyan-mode
                        ob-http open-junk-file orderless org-cliplink
                        org-contrib org-download org-journal org-mime
                        org-pomodoro org-present org-projectile org-rich-yank
                        org-superstar orgit-forge overseer ox-gfm ox-twbs
                        paradox password-generator persistent-scratch
                        persistent-soft php-auto-yasnippets php-extras phpunit
                        pip-requirements pipenv pippel plantuml-mode poetry
                        popwin prettier-js pug-mode py-isort pydoc pyenv-mode
                        pylookup pytest quickrun rainbow-delimiters
                        rainbow-identifiers rainbow-mode ranger restart-emacs
                        ron-mode rustic sass-mode scss-mode setenv-file
                        shell-pop shrink-path slack slim-mode smeargle
                        solarized-theme space-doc spaceline
                        spacemacs-purpose-popwin spacemacs-whitespace-cleanup
                        sphinx-doc sql-indent sqlite3 string-edit-at-point
                        string-inflection symbol-overlay symon systemd tagedit
                        term-cursor terminal-here toc-org toml-mode
                        treemacs-evil treemacs-icons-dired treemacs-magit
                        treemacs-persp treemacs-projectile typescript-mode
                        ucs-utils undo-fu undo-fu-session unfill unicode-fonts
                        unkillable-scratch vertico vi-tilde-fringe vim-powerline
                        vimrc-mode volatile-highlights vundo web-beautify
                        web-mode wgrep which-key winum writeroom-mode ws-butler
                        yaml-mode yapfify yasnippet-snippets zenburn-theme))
 '(paradox-github-token t)
 '(safe-local-variable-values
   '((eval progn
           (add-to-list 'lsp-file-watch-ignored-directories
                        "[/\\\\]\\.yarn-cache-1000\\'")
           (add-to-list 'lsp-file-watch-ignored-directories
                        "[/\\\\]\\cljs-out\\'")
           (add-hook 'clj-refactor-mode-hook
                     (lambda nil
                       (dolist
                           (ns
                            '("^airdex.airdex-data.http-api.integrant.adsb-simulator"
                              "^airdex.airdex-data.http-api.integrant.astm-relay"
                              "^airdex.airdex-data.http-api.integrant.astm-aoi-subscription"
                              "^airdex.airdex-data.http-api.integrant.db"
                              "^airdex.airdex-data.http-api.integrant.efb"
                              "^airdex.airdex-data.http-api.integrant.server"
                              "^airdex.airdex-data-spec.interface"
                              "^int.airdex.airdex-data.http-api.aircraft-position.routes-test"
                              "^int.airdex.airdex-data.http-api.core-test"
                              "^int.airdex.airdex-data.http-api.efb-test"
                              "^int.airdex.airdex-data.http-api.integrant.astm-relay-test"
                              "^int.airdex.airdex-data.http-api.uss.routes-test"))
                         (add-to-list 'cljr-libspec-whitelist ns)))))
     (cider-ns-code-reload-tool . clj-reload) (cljr-auto-sort-ns)
     (cider-ns-refresh-after-fn . "user/resume-system-if-prepared")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (javascript-backend . tide) (javascript-backend . tern)
     (javascript-backend . lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
