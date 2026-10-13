;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-alh")
 '(helm-external-programs-associations '(("pdf" . "brave-browser")))
 '(package-selected-packages
   '(a ace-link ace-window aggressive-indent aio alert all-the-icons anzu async
       auto-compile auto-highlight-symbol auto-yasnippet avy bind-map
       browse-at-remote centered-cursor-mode cfrs cider cider-eval-sexp-fu
       clang-format clean-aindent-mode clojure-essential-ref clojure-mode
       clojure-snippets closql code-review color-identifiers-mode
       column-enforce-mode command-log-mode company company-emoji
       company-quickhelp company-statistics company-web
       compleseus-spacemacs-help cond-let consult consult-lsp consult-yasnippet
       csv-mode dash deferred define-word devdocs diff-hl diminish
       dired-quick-sort disable-mouse docker dockerfile-mode doom-modeline
       doom-themes dotenv-mode drag-stuff dumb-jump eat edit-indirect elisp-def
       elisp-demos elisp-slime-nav emacsql embark embark-consult emmet-mode
       emoji-cheat-sheet-plus emojify emr envrc epl esh-help
       eshell-prompt-extras eshell-z eval-sexp-fu evil evil-anzu evil-args
       evil-cleverparens evil-collection evil-easymotion evil-escape
       evil-evilified-state evil-exchange evil-goggles evil-iedit-state
       evil-indent-plus evil-lion evil-lisp-state evil-matchit evil-mc
       evil-nerd-commenter evil-numbers evil-org evil-surround evil-textobj-line
       evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar
       expand-region eyebrowse f fancy-battery flycheck flycheck-elsa
       flycheck-package flycheck-pos-tip flyspell-correct flyspell-correct-popup
       font-utils forge gh-md ghub git-link git-messenger git-modes
       git-timemachine gitignore-templates gntp gnuplot golden-ratio
       google-translate goto-chg graphviz-dot-mode haml-mode helm helm-core
       helm-make hide-comnt highlight-indentation highlight-numbers
       highlight-parentheses hl-todo holy-mode ht htmlize hungry-delete
       hybrid-mode hydra iedit imenu-list impatient-mode indent-guide info+
       inheritenv inspector js-doc js2-mode js2-refactor json-mode
       json-navigator json-reformat json-snatcher kaocha-runner keycast ligature
       link-hint lispy lispyville list-utils livid-mode llama log4e lorem-ipsum
       lsp-mode lsp-origami lsp-treemacs lsp-ui lv macrostep magit magit-section
       magit-todos marginalia markdown-mode markdown-toc multi-line multi-term
       multi-vterm multiple-cursors nameless nerd-icons nodejs-repl npm-mode
       open-junk-file orderless org org-category-capture org-cliplink
       org-contrib org-download org-jira org-journal org-mime org-pomodoro
       org-present org-project-capture org-projectile org-rich-yank
       org-superstar orgit orgit-forge origami overseer ox-gfm ox-jira ox-twbs
       package-lint page-break-lines paradox paredit parent-mode parseclj
       parseedn password-generator pcache pcre2el persistent-scratch
       persistent-soft persp-mode pfuture pkg-info popup popwin pos-tip posframe
       prettier-js projectile pug-mode queue quickrun rainbow-delimiters
       rainbow-identifiers rainbow-mode ranger request restart-emacs s sass-mode
       scss-mode sesman setenv-file shell-pop shift-number shrink-path shut-up
       simple-httpd skewer-mode slim-mode smartparens smeargle space-doc
       spacemacs-purpose-popwin spacemacs-whitespace-cleanup spinner
       string-edit-at-point string-inflection symbol-overlay symon tablist
       tagedit term-cursor terminal-here toc-org transient treemacs
       treemacs-evil treemacs-icons-dired treemacs-magit treemacs-persp
       treemacs-projectile treepy ucs-utils undo-fu-session unicode-fonts
       unkillable-scratch uuidgen vertico vi-tilde-fringe visual-fill-column
       volatile-highlights vterm vundo web-beautify web-completion-data web-mode
       wfnames wgrep window-purpose winum with-editor writeroom-mode ws-butler
       yaml yaml-mode yasnippet yasnippet-snippets))
 '(paradox-github-token t)
 '(persp-reset-windows-on-nil-window-conf nil)
 '(safe-local-variable-values
   '((cider-clojure-cli-global-options . -A:versions:dev:test)
     (eval progn
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
                              "^int.airdex.airdex-data.http-api.aircraft-position.routes-test"
                              "^int.airdex.airdex-data.http-api.core-test"
                              "^int.airdex.airdex-data.http-api.efb-test"
                              "^int.airdex.airdex-data.http-api.integrant.astm-relay-test"
                              "^int.airdex.airdex-data.http-api.uss.routes-test"))
                         (add-to-list 'cljr-libspec-whitelist ns)))))
     (lsp-json-schemas
      . [(:fileMatch ["*.geojson"] :url
                     "https://geojson.org/schema/GeoJSON.json")
         (:fileMatch [".jsbeautifyrc"] :url
                     "https://json.schemastore.org/jsbeautifyrc.json")
         (:fileMatch ["pyrightconfig.json"] :url
                     "https://raw.githubusercontent.com/microsoft/pyright/main/packages/vscode-pyright/schemas/pyrightconfig.schema.json")])
     (cider-ns-refresh-after-fn . "integrant.repl/resume")
     (lsp-yaml-schemas
      (https://json.schemastore.org/chart.json . ["**/Chart.yaml$"])
      (https://json.schemastore.org/chart-lock.json . ["**/Chart.lock$"])
      (kubernetes . ["charts/*/templates/*.yaml"])
      (https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/v1.174.2/service-schema.json
       . ["**/*pipeline*"]))
     (eval progn
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
