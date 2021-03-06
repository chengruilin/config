; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path
   '(
     "~/.chrconfigs/layers"
     )
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     php
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; -------------- private layer ---------------
     ;;flutter
     ;;weex
     vue

     ;; -------------- public layer ----------------
     helm

     ;; Lisp Language
     common-lisp
     emacs-lisp
     ;; Python Language
     (python :variables python-backend 'anaconda)
     ipython-notebook
     ;; Web Dev
     html
     javascript
     react

     (markdown :variables markdown-live-preview-engine 'vmd)
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     java
     yaml

     (chinese :variables
              chinese-enable-avy-pinyin nil
              chinese-enable-fcitx nil
              chinese-enable-youdao-dict t)
     (elfeed :variables
             elfeed-enable-web-interface t
             rmh-elfeed-org-files (list "~/.chrconfigs/rssfeeds/dev-feeds.org"
                                        "~/.chrconfigs/rssfeeds/favor-feeds.org"
                                        "~/.chrconfigs/rssfeeds/news-feeds.org"))
     ;;pdf-tools
     ;;auto-completion
     ;;d5d55554-ee2a-4a9e-8fb7-2b513e4fd45c
     (wakatime :variables
               wakatime-api-key  "d5d55554-ee2a-4a9e-8fb7-2b513e4fd45c"
               ;; use the actual wakatime path
               wakatime-cli-path "/usr/local/bin/wakatime")
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-return-key-behavior 'nil
                      auto-completion-tab-key-behavior 'complete
                      ;; auto-completion-complete-with-key-sequence '"jk"
                      auto-completion-complete-with-key-sequence-delay 0.2
                      auto-completion-private-snippets-directory nil
                      :disabled-for org git shell)

     ;; Disabling by default
     (gtags :variables gtags-enable-by-default t)

     (better-defaults :variables
                      better-defaults-move-to-beginning-of-code-first t)
     emacs-lisp
     git
     ;;sql
     (typescript :variables
                 typescript-fmt-on-save t)
     ;; colors layer with nyan cat
     ;; (colors :variables colors-enable-nyan-cat-progress-bar t)
     ;; go
     (go :variables go-use-gometalinter t)
     ;; markdown
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t)
     (shell :vgriables
            shell-default-height 30
            shell-default-position 'bottom)

     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ;;vue-mode
     ;; lsp-mode
     ;; lsp-vue
     ;; company-lsp
     ;;google-translate
     ;;dart-mode
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    php-extras
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(misterioso
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;;dotspacemacs-default-font '("Source Code Variable"
   ;;"Hiragino Sans GB"
   ;;设置等宽字体
   dotspacemacs-default-font '("WenQuanYi Micro Hei Mono"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.6)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;;(add-to-list 'auto-mode-alist '("\\.njs\\'" . web-mode))
  ;;(setq org-reveal-root "/revealjs")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;(setq-default js2-basic-offset 2)
  ;;(setq-default js-indent-level 2)
  ;;(setq-default css-indent-offset 2)
  ;;(setq indent-tabs-mode nil
  ;;        js-indent-level 2)

  ;; Bind clang-format-region to C-M-tab in all modes:
  (global-set-key [C-M-tab] 'clang-format-region)
  ;; Bind clang-format-buffer to tab on the c++-mode only:
  (add-hook 'c++-mode-hook 'clang-format-bindings)
  (defun clang-format-bindings ()
    (define-key c++-mode-map [tab] 'clang-format-buffer))

  ;; projectile
  (setq projectile-enable-caching t)
  ;;(setq projectile-indexing-method 'native)

  ;; 关闭自动备份
  (setq make-backup-files nil)

  ;; 选择内容之后输入删除老的内容
  (delete-selection-mode 1)

  ;; 自动加载外部修改过的文件
  (global-auto-revert-mode 1)

  ;; 更改org-mode下的图标
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  ;; org-mode code Block 语法高亮，需要 revert-buffer 生效
  (setq org-src-fontify-natively t)

  ;; 设置底部 powerline 状态栏的样式
  (setq powerline-default-separator 'arrow)

  ;; 使用 Hippie Expand 来完成补全
  (setq hippie-expand-try-function-list '(try-expand-debbrev
                                          try-expand-debbrev-all-buffers
                                          try-expand-debbrev-from-kill
                                          try-complete-file-name-partially
                                          try-complete-file-name
                                          try-expand-all-abbrevs
                                          try-expand-list
                                          try-expand-line
                                          try-complete-lisp-symbol-partially
                                          try-complete-lisp-symbol))
  (global-set-key (kbd "s-/") 'hippie-expand)

  ;; yas-snippets
  (setq yas-snippet-dirs (append yas-snippet-dirs
                                 '("~/.chrconfigs/snippets")))

  ;; org-mode key-maps
  (add-hook 'org-mode-hook
            (lambda ()
              (progn (local-set-key (kbd "<s-return>") 'org-meta-return)
                     )))
  (add-to-list 'org-structure-template-alist '("n" . "NOTES"))

  ;; zoom control
  (global-set-key (kbd "M-<up>") 'zoom-in)
  (global-set-key (kbd "M-<down>") 'zoom-out)

  ;; Intented Buffer
  (global-set-key (kbd "s-f") 'spacemacs/indent-region-or-buffer)

  ;; 多光标编辑
  (global-set-key (kbd "M-s e") 'iedit-mode)

  ;; 在 Company 补全模式下,用 C-n,C-p上下切换
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous))

  ;; 设置js2-mode下分号warning不显示
  (setq js2-strict-missing-semi-warning nil)
  (global-company-mode)
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   js-indent-level 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  (spacemacs/set-leader-keys "yT" 'youdao-dictionary-search-at-point)
  ;; personal key bindings
  (spacemacs/set-leader-keys "yt" 'youdao-dictionary-search-at-point+)
  (spacemacs/set-leader-keys "ys" 'youdao-dictionary-search)
  (global-set-key (kbd "C-x y T") 'youdao-dictionary-search-at-point)
  (global-set-key (kbd "C-x y t") 'youdao-dictionary-search-at-point+)
  (global-set-key (kbd "C-x y s") 'youdao-dictionary-search)

  ;; eclim
  (setq eclim-eclipse-dirs '("~/snap/eclipse/29")
        eclim-executable "~/opt/eclipse/eclim")

  ;; Config Object-C mode
  ;; (add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.m\\'" . objc-mode))
  (setq auto-mode-alist (cons '("\\.m\\'" . objc-mode)
                              (delq (assoc "\\.m\\'" auto-mode-alist) auto-mode-alist)))
  (setq auto-mode-alist (cons '("\\.mm\\'" . objc-mode)
                              (delq (assoc "\\.mm\\'" auto-mode-alist) auto-mode-alist)))


  ;; Config for org-mode
  (defvar org-agenda-dir "" "gtd org files location")
  (setq-default org-agenda-dir "~/.chr-org")
  (setq-default org-agenda-read-book-dir "~/.chr-org/books")
  (setq-default org-agenda-read-doc-dir "~/.chr-org/doc")
  (setq-default org-agenda-code-dir "~/.chr-org/code")
  (setq-default org-agenda-local-dir "~/.chr-org/local")

  (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
  (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
  (setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
  (setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-agenda-files (list org-agenda-dir
                               org-agenda-local-dir
                               org-agenda-code-dir
                               org-agenda-read-doc-dir
                               org-agenda-read-book-dir))

  ;; Config for org-capture-templates
  (setq org-capture-templates
        '(
          ("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
           "* %?\n %i\n %U"
           :empty-lines 1)
          ("b" "Ideas" entry (file+headline org-agenda-file-note "Quick notes")
           "* TODO [#B] %?\n %i\n %U"
           :empty-lines 1)
          ("l" "links" entry (file+headline org-agenda-file-note "Quick notes")
           "* TODO [#C] %?\n %i\n %a \n %U"
           :empty-lines 1)
          )
        )

  ;; Config for task
  ;; org-agenda will show "w" and "W"
  (setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
          ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
          ("wc" "不重要且不紧急的任务" tags-todo "+PRIORITY=\"C\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
            ))
          )
        )

  (setq org-link-abbrev-alist
        '(
          ("url-to-ja" . "http://translate.google.fr/translate?sl=en&tl=ja&u=%h")
          ("google"    . "http://www.google.com/search?q=")
          ("gmap"      . "http://maps.google.com/maps?q=%s")
          ))

  ;;For dart mode
  ;; (add-hook 'dart-mode-hook 'flycheck-mode)
  ;; (setq dart-enable-analysis-server t)

  ;; for-vue-edit
  ;; (require 'lsp-mode)
  ;; (require 'lsp-vue)
  ;; (require 'company-lsp)
  ;; (push 'company-lsp company-backends)
  ;; (setq company-lsp-enable-snippet t)

  ;; (setq company-minimum-prefix-length 1)
  ;; (setq company-dabbrev-downcase nil)
  ;; (setq company-idle-delay 0.5)
  ;; (add-hook 'company-mode-hook 'company-quickhelp-mode)
  ;; (add-to-list 'company-backends 'company-lsp)

  ;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  ;; (add-hook 'web-mode-hook 'company-mode)
  ;; (add-hook 'web-mode-hook 'lsp-vue-enable)

  ;; Google-translate
  (setq-default google-translate-enable-ido-completion t)
  (setq-default google-translate-default-source-language "en")
  (setq-default google-translate-default-target-language "zh-CN")
  (setq-default google-translate-base-url
                "https://translate.google.cn/translate_a/single"
                google-translate--tkk-url
                "https://translate.google.cn/")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mac-mouse-wheel-mode t)
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier (quote super))
 '(org-agenda-files
   (quote
    ("/Users/linryan/org/gtd.org" "/Users/linryan/org/journal.org" "/Users/linryan/org/notes.org" "/Users/linryan/org/snippet.org" "/Users/linryan/org/code/read_flutter_source_code.org" "/Users/linryan/org/code/read_java_source_code.org" "/Users/linryan/org/code/read_okhttp_source_code.org" "/Users/linryan/org/code/read_react_native_source_code.org" "/Users/linryan/org/doc/doc_android_app_bundle.org" "/Users/linryan/org/doc/doc_info_elisp.org" "/Users/linryan/org/doc/doc_web_idea_plugin_develop.org" "/Users/linryan/org/books/being_friends_with_time.org" "/Users/linryan/org/books/how_to_read_a_book.org" "/Users/linryan/org/books/the_art_of_unix_programming.org")))
 '(package-selected-packages
   (quote
    (misterios-theme slime-company slime common-lisp-snippets geiser lv polymode ht transient phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode helm-gtags ggtags go-guru go-eldoc company-go go-mode vmd-mode spinner anzu undo-tree smartparens markdown-mode parent-mode pkg-info epl gitignore-mode flx highlight magit-popup git-commit with-editor goto-chg powerline request disaster company-c-headers cmake-mode clang-format bind-map bind-key packed f dash s helm avy helm-core async popup yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc ein request-deferred websocket deferred cython-mode company-anaconda anaconda-mode pythonic ox-reveal rainbow-mode rainbow-identifiers color-identifiers-mode wakatime-mode youdao-dictionary names chinese-word-at-point iedit evil projectile org-plus-contrib magit ghub hydra company-dart yaml-mode company-emacs-eclim eclim dart-mode pdf-tools tablist elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet elfeed flycheck-pos-tip lsp-ui lsp-vue company-lsp lsp-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data vue-mode edit-indirect ssass-mode vue-html-mode pyim pyim-basedict pangu-spacing find-by-pinyin-dired fcitx ace-pinyin pinyinlib helm-company helm-c-yasnippet fuzzy company-tern dash-functional company-statistics company-quickhelp pos-tip company auto-yasnippet ac-ispell auto-complete ox-gfm org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help wgrep smex ivy-hydra counsel-projectile counsel swiper ivy tern skewer-mode simple-httpd json-snatcher json-reformat yasnippet multiple-cursors js2-mode tide typescript-mode flycheck sql-indent ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org spaceline smeargle restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox orgit org-bullets open-junk-file neotree mwim move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint json-mode js2-refactor js-doc indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode coffee-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
