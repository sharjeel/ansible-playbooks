; Batch emacs script for installing starter kit and other packages
(setq pkgs-to-install 
      '(
        monokai-theme
        solarized-theme
        ack
        multi-term
        projectile
        js2-mode
        slime
	))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(package-refresh-contents)
(mapcar 'package-install pkgs-to-install)



