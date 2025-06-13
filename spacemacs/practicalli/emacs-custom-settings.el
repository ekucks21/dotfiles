;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-external-programs-associations '(("pdf" . "brave-browser")))
 '(package-selected-packages nil)
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
