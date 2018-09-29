;; packages.el --- weex layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Ryan <ryan@Qiezi-Macbook>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `weex-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `weex/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `weex/pre-init-PACKAGE' and/or
;;   `weex/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst weex-packages
  '(
    lsp-mode
    lsp-vue
    company-lsp
    web-mode
    company
    )
  "The list of Lisp packages required by the weex layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")
(defun weex/post-init-company()
  (spacemacs|add-company-hook web-mode))

(defun weex/init-lsp-mode()
  (use-package lsp-mode))

(defun weex/init-lsp-vue()
  (use-package lsp-vue
    :defer t
    :config
    (progn
      (add-hook 'web-mode-hook 'lsp-vue-enable))
    ))

(defun weex/init-company-lsp()
  (use-package company-lsp
    :defer t
    :config
    (progn
      (push 'company-lsp company-backends)
      (add-to-list 'company-backends 'company-lsp))
    ))

(defun weex/post-init-web-mode()
  (add-hook 'web-mode-hook 'company-mode)
  (add-hook 'company-mode-hook 'company-quickhelp-mode)
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
   )
;;; packages.el ends here
