(setq inhibit-startup-message t)

(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (htmlize yasnippet markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (R . t)))




(require 'yasnippet)
(yas-global-mode 1)

(global-set-key (kbd "C-S-m") (lambda () (interactive) (insert "%>%")))

(global-set-key (kbd "C-S-t") (lambda () (interactive) (insert "%T>%")))

(global-set-key (kbd "C-S-e") (lambda () (interactive) (insert "%$%")))

(global-set-key (kbd "C-S-a") (lambda () (interactive) (insert "%<>%")))


(setq default-directory "C:/Users/Suman/")
