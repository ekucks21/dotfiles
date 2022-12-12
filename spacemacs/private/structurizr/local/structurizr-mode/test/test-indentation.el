;;; test-indentation.el --- tests for the indentation of Structurizr files

;; Copyright (C) 2021 by Jorge Gueorguiev Garcia

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

(ert-deftest no-indentation-constants ()
  "There is no indentation for constants"

  (with-structurizr-temp-buffer
   "
!constant ORGANISATION_NAME \"Sample\"
!constant GROUP_NAME \"Sample2\"
"
   
   (forward-cursor-on "!constant")
   (call-interactively 'indent-for-tab-command)
   (should (= (current-indentation) 0))))

(ert-deftest child-indented-once ()
  "A child shown by the {} is indented one level"

  (with-structurizr-temp-buffer
   "
workspace {
model {
}    
}
"
   
   (forward-cursor-on "model")
   (call-interactively 'indent-for-tab-command)
   (should (= (current-indentation) 4))
   (forward-line)
   (call-interactively 'indent-for-tab-command)
   (should (= (current-indentation) 4))
   (forward-line)
   (call-interactively 'indent-for-tab-command)
   (should (= (current-indentation) 0))))

(ert-deftest grand-child-indented-twice ()
  "A child shown by the {} is indented one level"

  (with-structurizr-temp-buffer
   "
workspace {
model {
person {
}
}    
}
"

   (forward-cursor-on "model")
   (call-interactively 'indent-for-tab-command)
   (forward-cursor-on "person")
   (call-interactively 'indent-for-tab-command)
   (should (= (current-indentation) 8))))
;;; test-indentation.el ends here
