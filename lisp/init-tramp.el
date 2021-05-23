(custom-set-variables
 ;; run the emacs server over TCP for "remote" access
 ;'(server-port "1492")
 '(server-use-tcp t)
 ;; Make auto-complete in minibuffer as fast as possible
 '(tramp-completion-reread-directory-timeout nil)
 ;; You'll want to setup some ssh wizardry (more on this later), 
 ;; but this ignores login prompts
 ;'(tramp-default-method "sshx")
 ;; By default tramp clobbers the ssh ControlPath setting used
 ;; below to avoid the password prompt
 '(tramp-use-ssh-controlmaster-options nil))

(use-package tramp
  :config
  ;; Since we're going to be doing this a lot, the minibar message 
  ;; tramp spits out for every file access is both spammy, distracting,
  ;; and often hides more relevant messages.
  (setq tramp-message-show-message nil)
  ;; Let tramp search $PATH as given to the $USER on the remote machine
  ;; (necessary to find 'hphpd' for instance)
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(add-to-list 'tramp-methods
 '("yadm"
   (tramp-login-program "yadm")
   (tramp-login-args (("enter")))
   (tramp-login-env (("SHELL") ("/bin/sh")))
   (tramp-remote-shell "/bin/sh")
   (tramp-remote-shell-args ("-c"))))
