;;; Adapted from Sebastian Rose's org publishing tutorial at 
;;; http://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html



(setq load-path
      (append
       (list 

;; we don't want it yet.
 "~/emacs/lisp/org-8.3.3/lisp"
 ; "~/emacs/lisp/org-8.2.10/contrib/lisp"

; we need this:
             "elisp"
)
       load-path))


(message "Org version = %s" (org-version))
(message "Org version = %s" (org-version))
(message "Org version = %s" (org-version))
(message "load-path = %s" load-path)



(require 'ox-publish)

(require 'org)

;;; default-dir is the directory from where the emacs to run
;;; this script is called.
(defvar base-dir default-directory)


;;; destination directory which  publish populates
(defvar pub-dir (concat base-dir "build/prj/"))


(defvar src-dir (concat base-dir "src/"))

;;; org-source-base-dir defined in postamble.el
(setq my-postamble-org-source-base-dir src-dir)

;;; directory where src 
(defvar top-dir src-dir)
(defvar style-dir (concat src-dir "style/"))


(defvar top
`("top"
 :base-directory ,top-dir
 :base-extension "org"
 :publishing-directory ,pub-dir
 :recursive t
 :publishing-function org-html-publish-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :auto-sitemap t
  ))


(defvar style `("style"
  :base-directory ,style-dir
  :base-extension "css\\|js\\|png"
  :publishing-directory ,(concat pub-dir "style/")
  :recursive t
  :publishing-function org-publish-attachment
  ))

(defvar prj '("prj" :components ("top" "style")))

(setq org-publish-project-alist 
      (list top 
	    style))



;;(sexp->html '(div (h1 (header))))

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

;;; Read the preamble and postamble from files.
(defvar header-file (concat src-dir "header.html"))
(defvar footer-file (concat src-dir "footer.html"))
(setq org-html-preamble (get-string-from-file header-file))
(setq org-html-postamble (get-string-from-file footer-file))


;;(setq org-html-preamble "<div><h1>Header</h1></div>")
;;(setq org-html-postamble "<div><h1> Footer</h1> </div>")

(org-publish-project 
 prj  ; project name
 t ; force
 )

