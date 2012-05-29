;;; php-reference.el -- hooks for php-reference and php-short-reference scripts

;; TODO:
;; - test for Markdown mode in `php-reference'
;; - write `php-short-reference' output to message buffer
;; - automatically run `php-short-reference' when over recognised symbol

(defvar php-reference-cmd "php-reference"
  "Command used by `php-reference' to generate Markdown-formatted PHP reference
   documentation. Called with one argument (the designated PHP builtin).")

(defvar php-reference-short-cmd "php-short-reference"
  "Command used by `php-short-reference' to generate a one-line function
   signature. Called with one argument (the designated PHP function).")

(defvar php-reference-buffer "*PHP Reference*"
  "Output buffer for `php-reference' command.")

(defun php-reference-read-symbol ()
  "Prompts for a PHP symbol, defaulting to symbol at point."
  ;; TODO
  (thing-at-point 'word)
  (let* ((default-symbol (if (region-active-p)
                             (buffer-substring-no-properties (region-beginning)
                                                             (region-end))
                           (symbol-at-point)))
         (entered-symbol (read-from-minibuffer
                          (format "View docs for (default \"%s\"): "
                                  default-symbol))))
    (if (string-equal entered-symbol "")
        default-symbol
      entered-symbol)))

(defun php-reference (symbol)
  "Generates reference documentation for a PHP builtin using `php-reference-cmd'
   and displays it in `php-reference-buffer'. When called interactively, prompts
   for the PHP symbol to fetch docs for, default to symbol at point."
  (interactive
   (list (php-reference-read-symbol)))
  (message "Fetching PHP documentation for `%s'..." symbol)
  (shell-command (format "%s %s" php-reference-cmd symbol)
                 php-reference-buffer)
  (save-excursion
    (switch-to-buffer-other-window php-reference-buffer t)
    ;; Use markdown-mode where available
    (require 'markdown-mode nil t)
    (if (functionp 'markdown-mode)
        (markdown-mode))))

(defun php-short-reference ()
  "Displays function signature for the PHP function at point."
  ;; FIXME: write to message buffer
  (shell-command (format "%s %s" php-reference-short-cmd (symbol-at-point))))
