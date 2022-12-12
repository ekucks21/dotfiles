;;; test-highlight.el --- test for syntax highlighting of structurizr-mode

;; Copyright (C) 2021 Jorge Gueorguiev Garcia

;; Author: Jorge Gueorguiev Garcia <jorge.gueorguiev@twoormore.eu>

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

;;; Code:

(require 'ert)
(require 'structurizr-mode)

(ert-deftest keywords-highlighting ()
  "We highlight correctly based on the keywords"

  (dolist (keyword '("workspace" "model" "impliedRelationships" "enterprise" "group" "person" "softwareSystem" "container" "component" "deploymentEnvironment" "deploymentGroup" "deploymentNode" "infrastructureNode" "softwareSystemInstance" "containerInstance" "element" "views" "systemLandscape" "systemContext" "filtered" "dynamic" "deployment" "custom" "styles" "relationship" "theme" "branding" "terminology" "configuration" "users"))
    (with-structurizr-temp-buffer
     keyword
     (should (face-at-cursor-p 'font-lock-keyword-face))))  )
