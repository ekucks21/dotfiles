;;; structurizr-mode.el --- Major mode for structurizr dsl file -*- lexical-binding: t -*-

;; Copyright (C) 2021 by Jorge Gueorguiev Garcia

;; Author: Jorge Gueorguiev Garcia <jorge.gueorguiev@twoormore.eu>
;; URL: https://hg.sr.ht/~miyamoto_akira/structurizr-mode
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.3"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Major mode for Structurizr dsl files. structurizr-mode provides
;; nothing at the moment.

;;; Code:

(defvar structurizr-tab-width 4 "Width of a tab for Structurizr mode")

(defgroup structurizr nil
  "Major mode for the Structurizr dsl"
  :group 'languages)

(defcustom structurizr-indent-level 4
  "The tab width to use when indenting"
  :type 'integer )

(defsubst structurizr--in-string-or-comment-p ()
  (nth 8 (syntax-ppss)))

(defun structurizr--block-indentation ()
  (let ((curline (line-number-at-pos)))
    (save-excursion
      (condition-case nil
          (progn
            (backward-up-list)
            (unless (= curline (line-number-at-pos))
              (current-indentation)))
        (scan-error nil)))))

(defun structurizr--previous-indentation ()
  (save-excursion
    (forward-line -1)
    (let (finish)
      (while (not finish)
        (cond ((bobp) (setq finish t))
              ((structurizr--in-string-or-comment-p) (forward-line -1))
              (t
               (let ((line (buffer-substring-no-properties
                            (line-beginning-position) (line-end-position))))
                 (if (not (string-match-p "\\'\\s-*\\'" line))
                     (setq finish t)
                   (forward-line -1))))))
      (current-indentation))))

(defun structurizr-indent-line ()
  "We indent the current line"
  (interactive)
  (let* ((curpoint (point))
         (pos (- (point-max) curpoint)))
    (back-to-indentation)
    (if (structurizr--in-string-or-comment-p)
        (goto-char curpoint)
      (let ((block-indentation (structurizr--block-indentation)))
        (delete-region (line-beginning-position) (point))
        (if block-indentation
            (if (looking-at "\\}")
                (indent-to block-indentation)
              (indent-to (+ block-indentation structurizr-indent-level)))
          (indent-to (structurizr--previous-indentation)))
        (when (> (- (point-max) pos) (point))
          (goto-char (- (point-max) pos)))))))

(defvar structurizr-keywords
  '("workspace" "model" "impliedRelationships" "enterprise" "group" "person" "softwareSystem" "container" "component" "deploymentEnvironment" "deploymentGroup" "deploymentNode" "infrastructureNode" "softwareSystemInstance" "containerInstance" "element" "views" "systemLandscape" "systemContext" "filtered" "dynamic" "deployment" "custom" "styles" "relationship" "theme" "branding" "terminology" "configuration" "users"))

(defvar structurizr-font-locks
  `((,(regexp-opt structurizr-keywords 'words) . font-lock-keyword-face)))

(defun structurizr-mode-variables ()
  "Set up initial buffer-local variables for Structurizr mode"
  (setq-local comment-start "#"))

(define-derived-mode structurizr-mode prog-mode "Structurizr DSL"
  "Structurizr mode isa major mode for the editing of Structurizr DSL files"
  (when structurizr-tab-width
    (setq tab-width structurizr-tab-width))
  (structurizr-mode-variables)

  ;;; Comments
  ;; Single line comment
  (modify-syntax-entry ?# "< b" structurizr-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" structurizr-mode-syntax-table)
  
  (setq-local comment-start "#")
  (setq-local comment-use-syntax t)
  (setq-local comment-start-skip "\\(//+\\|/\\*+\\)\\s *")
  
  (make-local-variable 'structurizr-indent-line)
  (setq-local indent-line-function 'structurizr-indent-line)
  (setq font-lock-defaults '((structurizr-font-locks))))

(add-to-list 'auto-mode-alist '("\\.dsl\\'" . structurizr-mode))

(provide 'structurizr-mode)

;;; structurizr-mode.el ends here
