;; Command to run to generate the tags file
;; http://mattbriggs.net/blog/2012/03/18/awesome-emacs-plugins-ctags/
(setq eproject-tags-etags "ctags -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public -f TAGS")
