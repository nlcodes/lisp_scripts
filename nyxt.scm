#!/usr/bin/env gsi
(shell-command
  "WEBKIT_DISABLE_COMPOSITING_MODE=1 GST_GL_PLATFORM=egl GST_GL_WINDOW=x11 GST_GL_API=opengl nyxt >/dev/null 2>&1 & disown")
