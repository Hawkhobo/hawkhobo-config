export PATH=.:/etc/alternatives/cuda/bin:/home/matt/bin:/home/matt/.cargo/bin:/home/matt/go/bin:/home/matt/.local/bin:/home/matt/.rbenv/shims:/home/matt/scripts:/home/matt/scripts/ff_utils:/opt/cuda/bin:/usr/bin:/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/libexec:/usr/lib/rustup/bin:/usr/local/bin:/usr/local/sbin:/var/lib/flatpak/exports/bin:/sbin:/bin:/usr/sbin

[[ -f /etc/profile ]] && . /etc/profile

if [ -t 0 ]; then
  echo " ~ $(pwd)/.bashrc ~ "
fi

if [ -t 0 ]; then
  for rc in $HOME/.bashrc.d/*.sh; do
	  source $rc
  done
fi
