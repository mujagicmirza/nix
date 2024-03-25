;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq
    org-superstar-headline-bullets-list '("◉" "○" "◉" "○" "◉")
)
(setq org-hide-emphasis-markers t)

(custom-theme-set-faces
        'user
        '(variable-pitch ((t (:family "ETBembo" :height 300 :weight thin))))
        '(fixed-pitch ((t ( :family "Monaco Nerd Font" :height 0.8)))))

(custom-theme-set-faces
 'user
 '(org-block ((t (:inherit fixed-pitch :background nil))))
 '(org-block-begin-line ((t (:inherit fixed-pitch :background "#00000"))))
 '(org-block-end-line ((t (:inherit fixed-pitch :background nil))))
 '(org-code ((t (:inherit (shadow doom-font)))))
 '(org-document-title ((t (:height 1.0)))) ;; 2.2
 '(org-document-info ((t (:height 1.0))))  ;; 1.5
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch) :height 1.0)))) ;; 0.5
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch) :foreground "#131313" :height 1.0)))) ;; 0.5
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 1.0)))) ;; 0.8
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
)
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook! 'org-mode-hook #'doom-disable-line-numbers-h)

;;(set-frame-parameter nil 'alpha-background 0.8)
;;(add-to-list 'default-frame-alist '(alpha-background . 0.8))

;;(after! doom-themes
  ;;(load-theme 'doom-nano-dark t))

(eval-after-load "ox-latex"
  '(add-to-list 'org-latex-classes
                '("tufte-handout"
                  "\\documentclass[nobib]{tufte-handout}
                   --%<--- snip --->%--
                   \\usepackage{nicefrac}
                   \\usepackage{listings}
                   \\usepackage{lstautogobble}  % Fix relative indenting
                   \\usepackage{color}          % Code coloring
                   \\usepackage{zi4}            % Nice font
                   \\usepackage{listings}
                   \\setlength\\parindent{0pt}

                   \\definecolor{bluekeywords}{rgb}{0.13, 0.13, 1}
                   \\definecolor{greencomments}{rgb}{0, 0.5, 0}
                   \\definecolor{redstrings}{rgb}{0.9, 0, 0}
                   \\definecolor{graynumbers}{rgb}{0.5, 0.5, 0.5}

                   \\lstset{
                   autogobble,
                   columns=fullflexible,
                   showspaces=false,
                   showtabs=false,
                   breaklines=true,
                   showstringspaces=false,
                   breakatwhitespace=true,
                   escapeinside={(*@}{@*)},
                   commentstyle=\\color{greencomments},
                   keywordstyle=\\color{bluekeywords},
                   stringstyle=\\color{redstrings},
                   numberstyle=\\color{graynumbers},
                   basicstyle=\\ttfamily\\footnotesize,
                   frame=l,
                   framesep=12pt,
                   xleftmargin=12pt,
                   tabsize=4,
                   captionpos=b
                   }
                   \\usepackage{units}
                   [NO-DEFAULT-PACKAGES]
                   [EXTRA]"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
(font-lock-add-keywords 'org-mode
                        '(("\\\\autocite{.+?}" . font-lock-keyword-face)))

(setq org-latex-default-class "tufte-handout"
      org-latex-pdf-process '("latexmk -pdf -bibtex-cond -f -outdir=%o %f"))

(setq doom-themes-treemacs-enable-variable-pitch nil)
(setq treemacs-git-mode 'extended)
(setq org-default-notes-file (concat org-directory "/home/mirza/worknotes.org"))

