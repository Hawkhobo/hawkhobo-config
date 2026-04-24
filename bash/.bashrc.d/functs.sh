dnf_available () {
  package_word=$1
  dnf list all | grep -i $package_word | grep -vi -e @ -e 686 | sort
}

my_motd () {
  bin_root=/usr/bin
  ff=$bin_root/fastfetch
  max_logos=507 # from: "fastfetch --list-logos"

  # ANSI color codes
  a='\033[38;5;'; z='\033[00m'; ylw="${a}190m"
  red="${a}196m"; grn="${a}82m"; blu="${a}27m"

  # pick a random distro
  distro_num=$($bin_root/shuf -i 1-${max_logos} -n1)
  os=$($ff --list-logos | \
       grep -E "^${distro_num}" | \
       head -1 | awk '{print $2}' | tr -d '"')

  echo -e "${red}.. ${blu}random distro emblem ${grn}#${blu} ${distro_num} ${red}: ${ylw}${os} ${red}..${z}\n"
  $ff --logo $os

  # login / terminal shell info
  echo -e "\n${red}[${ylw}$(ps -o comm= $PPID)${red}]" \
          "${blu}loading: ${grn}${HOME}/.bash_profile" \
          "${red}(${ylw}$0${red}) ${blu}..${z}\n"
  }
