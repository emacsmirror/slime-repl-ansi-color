From max at openchat.com  Sun Mar 25 13:45:10 2012
From: max at openchat.com (Max Mikhanosha)
Date: Sun, 25 Mar 2012 16:45:10 -0400
Subject: [slime-devel] contrib/slime-repl-ansi-color.el
Message-ID: <87k428tnop.wl%max@openchat.com>

The attached contribution when added to slime setup enables ANSI
colors in slime output.

How to use:

Add 'slime-repl-ansi-color to (slime-setup) call, like this

(slime-setup '(slime-fancy slime-repl-ansi-color))

How to test:

;; Under SBCL
(sb-ext:run-program "/bin/ls" '("-l" "--color=yes" "..") :output *standard-output*)

Example of how it looks: http://i.imgur.com/6Cbef.png

-------------- next part --------------
A non-text attachment was scrubbed...
Name: slime-repl-ansi-color.el
Type: application/octet-stream
Size: 1031 bytes
Desc: not available
URL: <http://lists.common-lisp.net/pipermail/slime-devel/attachments/20120325/cd61c03a/attachment.obj>
-------------- next part --------------
