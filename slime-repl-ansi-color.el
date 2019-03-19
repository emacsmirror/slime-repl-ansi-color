

;; This file is NOT part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

(require 'ansi-color)

(define-slime-contrib slime-presentations
  "Turn on ANSI colors in REPL output"
  (:authors "Max Mikhanosha")
  (:license "GPL")
  (:slime-dependencies slime-repl)
  (:on-load
   (add-hook 'slime-repl-mode-hook
             (lambda ()
               (slime-repl-ansi-on)))))

(defvar slime-repl-ansi-color nil
  "When Non-NIL will process ANSI colors in the lisp output")

(make-variable-buffer-local 'slime-repl-ansi-color)

(defun slime-repl-ansi-on ()
  "Set `ansi-color-for-comint-mode' to t."
  (interactive)
  (setq slime-repl-ansi-color t))

(defun slime-repl-ansi-off ()
  "Set `ansi-color-for-comint-mode' to t."
  (interactive)
  (setq slime-repl-ansi-color nil))

(defadvice slime-repl-emit (around slime-repl-ansi-colorize activate compile)
  (with-current-buffer (slime-output-buffer)
    (let ((start slime-output-start))
      (setq ad-return-value ad-do-it)
      (when slime-repl-ansi-color
        (ansi-color-apply-on-region start slime-output-end)))))


(provide 'slime-repl-ansi-color)
