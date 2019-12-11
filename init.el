;; no mouse interface needed and no splash screen :D
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

(setq frame-resize-pixelwise t)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))



(setq mac-command-modifier 'meta)
 
(set-frame-font "Fantasque Sans Mono 16")


(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmelade" . "https://marmalade-repo.org") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


(require 'use-package)
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;;enable modeline from doom
  (doom-modeline-mode)

  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
 (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)


  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


(require 'ace-window)
(global-set-key "\M-o" 'ace-window)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-vhdl-server (quote hdl-checker))
 '(package-selected-packages
   (quote
    (helm-lsp vhdl-capf vhdl-tools lsp-mode company helm use-package doom-themes doom-modeline ace-window))))
 '(custom-safe-themes
   (quote
    ("dd854be6626a4243375fd290fec71ed4befe90f1186eb5b485a9266011e15b29" "a4fa3280ffa1f2083c5d4dab44a7207f3f7bcb76e720d304bd3bd640f37b4bef" "bc99493670a29023f99e88054c9b8676332dda83a37adb583d6f1e4c13be62b8" "0fe9f7a04e7a00ad99ecacc875c8ccb4153204e29d3e57e9669691e6ed8340ce" "4b0b568d63b1c6f6dddb080b476cfba43a8bbc34187c3583165e8fb5bbfde3dc" "b60f08ddc98a95485ec19f046a81d5877b26ab80a67782ea5b91a00ea4f52170" "eb94e44599a45c495ad472ad551a40b87cbc4bae9631211e7a78d72b102c61b1" "8c75e2bdf8d1293c77a752dd210612cfb99334f7edd360a42a58a8497a078b35" "5e0b63e0373472b2e1cf1ebcc27058a683166ab544ef701a6e7f2a9f33a23726" "5c9a906b076fe3e829d030a404066d7949e2c6c89fc4a9b7f48c054333519ee7" "41039913efab185af1ec1b13ff4df36d6941994d5e3dee39791f30fcd94b42be" "92d8a13d08e16c4d2c027990f4d69f0ce0833c844dcaad3c8226ae278181d5f3" "669e05b25859b9e5b6b9809aa513d76dd35bf21c0f16d8cbb80fb0727dc8f842" "e7666261f46e2f4f42fd1f9aa1875bdb81d17cc7a121533cad3e0d724f12faf2" "5091eadbb87fa0a168a65f2c3e579d1a648d764f12ab9d3ab7bdefca709cd2a5" "1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee" "a4b9eeeabde73db909e6b080baf29d629507b44276e17c0c411ed5431faf87dd" "dc677c8ebead5c0d6a7ac8a5b109ad57f42e0fe406e4626510e638d36bcc42df" "a02836a5807a687c982d47728e54ff42a91bc9e6621f7fe7205b0225db677f07" "423435c7b0e6c0942f16519fa9e17793da940184a50201a4d932eafe4c94c92d" default)))
 '(doom-modeline-mode t)



;;HELM Setup
;;------------------------------------------------------------------------------
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") #'helm-mini)
(global-set-key (kbd "C-x k") #'kill-this-buffer)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 40)
(helm-autoresize-mode 1)

(helm-mode 1)


(global-set-key "\M-/" 'complete-symbol)


(require 'use-package)
(setq lsp-vhdl-server "hdl_checker")
;;(setq lsp-vhdl-server-path "hdl_checker") ; only needed if hdl_checker is not already on the PATH

(use-package lsp-mode
  :config (add-hook 'vhdl-mode-hook 'lsp))

;; start server for use with emacs-client
;;------------------------------------------------------------------------------
(server-start)

;; I ususally always wanna see the new stuff.
;;------------------------------------------------------------------------------
(auto-revert-mode)


;; make C-o and C-O behave similar to VIM
;;------------------------------------------------------------------------------
(defun open-line-above ()
  "inserted line above current position"
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (open-line 1)
    )
  )
(defun open-line-below ()
  "inserted line above current position"
  (interactive)
  (save-excursion
    (move-end-of-line 1)
    (open-line 1)
    )
  )
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)


;; make calc more convenient to use
;;------------------------------------------------------------------------------
(global-set-key (kbd "<f2>") 'calc-dispatch)


;; dired enable a to avoid trash dired buffers
;;------------------------------------------------------------------------------
(put 'dired-find-alternate-file 'disabled nil)
