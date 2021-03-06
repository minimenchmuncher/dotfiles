:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Ezra's emacs startup
;;; based on the work of many others, including github.com/belything/dotemacs
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; To install copy directory at ~/.emacs.d
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basic config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)                   ;; common lisp compatibility
(server-start)                  ;; start server so clients can attach
(setq make-backup-files nil)    ;; don't create file~ files
(setq inhibit-startup-screen t) ;; don't show startup screen
(column-number-mode t)          ;; show column number in status bar
(global-auto-revert-mode t)     ;; auto update files that have changed on disk
(delete-selection-mode t)       ;; type over selection deletes selected text
(setq ns-right-alternate-modifier 'none) ;; ignore right-side alt/opt

;;; enable whitespace-mode for all buffers
(global-whitespace-mode t)
(setq whitespace-style '(face trailing tabs lines-tail tab-mark))

;;; no tabs
(setq-default indent-tabs-mode nil)

;;; fill to 80 columns
;;(setq-default fill-column 80)
(setq whitespace-style nil)

;;; add ~/.emacs.d/vendor to load path
(add-to-list 'load-path (concat user-emacs-directory "vendor"))

;;; add paths
;;;; none here.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ELPA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq package-archives' (
                         ("gnu"          . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Set HTTP proxy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; if you need an http proxy, do that here.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sanify paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load Configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; load files from the dotfile path
(defun load-config (file)
  (load-file (concat user-emacs-directory file)))

;;; set our customize file to custom.el and load it
(setq custom-file (concat user-emacs-directory "custom.el"))
(load-config "custom.el")

;;; and then other configs
(load-config "tools.el")     ;; load tools and package settings
(load-config "window.el")    ;; window settings (colors, status bars, etc)

;;; load encrypted secrets file if exists
(if (file-exists-p (concat user-emacs-directory "secrets.el.gpg"))
    (load-config "secrets.el.gpg"))


;; package requirements
(require 'package)
;(require 'transpose-frame)

(setq default-directory (concat (getenv "HOME") "/"))
