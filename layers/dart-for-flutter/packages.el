;;; packages.el --- dart-for-flutter layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: ryan <ryan@ryan-pc>
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
;; added to `dart-for-flutter-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `dart-for-flutter/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `dart-for-flutter/pre-init-PACKAGE' and/or
;;   `dart-for-flutter/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst dart-for-flutter-packages
  '(
    dart-mode
    )
  "The list of Lisp packages required by the dart-for-flutter layer.

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
(defun dart-for-flutter/post-init-company()
  (spacemacs|add-company-hook dart-mode))

(defun dart-for-flutter/post-init-flycheck()
  (spacemacs/add-flycheck-hook 'dart-mode))

(defun dart-for-flutter/init-dart-mode()
  (use-package dart-mode
    :defer t
    :init
    (progn
      (add-hook 'dart-mode-hook #'(lambda () (modify-syntax-entry ?_ "w"))))
    :config
    (progn
      (spacemacs/set-leader-keys
        ;; (spacemacs/set-leader-keys-for-major-mode 'dart-mode
        "dg" 'dart-goto
        "df" 'dart-format
        )

      ;;      (use-package helm-dart
      ;;        :config
      ;;        (progn
      ;;          (spacemacs/set-leader-keys
      ;;            "dq" 'helm-dart-quick-fix
      ;;            )
      ;;          )
      ;;        )
      )
    ))

;;; packages.el ends here
