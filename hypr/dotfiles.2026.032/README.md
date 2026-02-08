# Some of Matt's dotfiles

I would not reccommend just copying  these into their respective folders.  Definitely pick and choose what you want.  There will be some prerequisite packages required.

-----

## Pre-reqss

Off the top of my head..

- Ruby
  - Check the Gemfile for instructions
   I put it in my $HOME folder, you can put it anywhere. $HOME/.bashrc.d works too.

- fastfetch

- hyprpaper

- xdg-desktop-portal-hyprland
  - Set this up as userland systemd service by copying `/usr/lib/systemd/xdg-desktop-portal-hyprland.service` to `/etc/systemd/user/` and enable it with `systemctl --user enable --now xdg-desktop-portal-hyprland`

- hyprpolkitagent
  - setup this the same way as the xdg portal (userland systemd)

- hypridle

- hyprlock

- nwg-dock-hyprland

- chromium

- hyprpicker

- nm-applet

- wl-clipboard / wl-copy / wl-paste

- The cursor theme Oxygen_Yellow is kinda nice.  If you want to put it in the `/usr/share/icons` folder as `Oxygen_Yellow`, then it is a one-liner to configure in hyprland.conf.

- The 3 wallpaper images in hyprpaper.d are original AI-generated for my 3 monitor setup.  An example for what you could do if you wish.


I know I'm forgetting something.  I put a bunch of time into styling Rofi a little better.  Go check out <nerdfonts.com> to get the same fonts.  Nerd fonts have the glyphs that are OUTSIDE the UNICODE standard, and are (more than ever) frequently used for type-base symbols instead of using vector graphics.  

I'd reccommend using *Nerd* fonts everywhere you can for cool points.  Almost all popular fonts have been ported to have a Nerd-version now.

----

That's all, folks!
