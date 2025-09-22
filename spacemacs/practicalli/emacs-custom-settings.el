;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-external-programs-associations '(("pdf" . "brave-browser")))
 '(package-selected-packages
   '(ace-link aggressive-indent all-the-icons auto-compile auto-highlight-symbol
              auto-yasnippet browse-at-remote centered-cursor-mode
              cider-eval-sexp-fu clean-aindent-mode clojure-essential-ref
              clojure-snippets code-review color-identifiers-mode
              column-enforce-mode command-log-mode company-emoji
              company-quickhelp company-statistics company-web
              compleseus-spacemacs-help consult-lsp consult-yasnippet csv-mode
              define-word devdocs diff-hl diminish dired-quick-sort
              disable-mouse docker dockerfile-mode doom-modeline doom-themes
              dotenv-mode drag-stuff dumb-jump eat edit-indirect elisp-def
              elisp-demos elisp-slime-nav embark-consult emmet-mode
              emoji-cheat-sheet-plus emr envrc esh-help eshell-prompt-extras
              eshell-z evil-anzu evil-args evil-cleverparens evil-collection
              evil-easymotion evil-escape evil-evilified-state evil-exchange
              evil-goggles evil-iedit-state evil-indent-plus evil-lion
              evil-lisp-state evil-matchit evil-mc evil-nerd-commenter
              evil-numbers evil-org evil-surround evil-textobj-line evil-tutor
              evil-unimpaired evil-visual-mark-mode evil-visualstar
              expand-region eyebrowse fancy-battery flycheck-elsa
              flycheck-package flycheck-pos-tip flyspell-correct-popup gh-md
              git-link git-messenger git-modes git-timemachine
              gitignore-templates gnuplot golden-ratio google-translate
              graphviz-dot-mode helm-make hide-comnt highlight-indentation
              highlight-numbers highlight-parentheses holy-mode hungry-delete
              hybrid-mode impatient-mode indent-guide info+ inspector js-doc
              js2-refactor json-mode json-navigator json-reformat kaocha-runner
              keycast ligature link-hint lispyville livid-mode lorem-ipsum
              lsp-origami lsp-treemacs lsp-ui macrostep magit-todos marginalia
              markdown-toc multi-line multi-term multi-vterm nameless
              nodejs-repl npm-mode open-junk-file orderless org-cliplink
              org-contrib org-download org-journal org-mime org-pomodoro
              org-present org-projectile org-rich-yank org-superstar orgit-forge
              overseer ox-gfm ox-twbs page-break-lines paradox
              password-generator persistent-scratch popwin prettier-js pug-mode
              quickrun rainbow-delimiters rainbow-identifiers rainbow-mode
              ranger restart-emacs sass-mode scss-mode setenv-file shell-pop
              slim-mode smeargle space-doc spacemacs-purpose-popwin
              spacemacs-whitespace-cleanup string-edit-at-point
              string-inflection symbol-overlay symon tagedit term-cursor
              terminal-here toc-org treemacs-evil treemacs-icons-dired
              treemacs-magit treemacs-persp treemacs-projectile undo-fu
              undo-fu-session unicode-fonts unkillable-scratch vertico
              vi-tilde-fringe volatile-highlights vundo web-beautify web-mode
              wgrep window-purpose winum writeroom-mode ws-butler yaml-mode
              yasnippet-snippets))
 '(paradox-github-token t)
 '(persp-reset-windows-on-nil-window-conf nil)
 '(safe-local-variable-values
   '((lsp-json-schemas
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
