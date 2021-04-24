{ pkgs, ... }:
{
#  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.afew.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };
  accounts.email = {
    accounts.ens = {
      address = "julien.malka@ens.fr";
      imap.host = "clipper.ens.fr";
      msmtp.enable = true;
      notmuch.enable = true;
#      afew.enable = true;
      primary = true;
      realName = "Julien Malka";
      passwordCommand = "${pkgs.gnupg}/bin/gpg -q --for-your-eyes-only --no-tty --exit-on-status-write-error --batch --passphrase-file ~/df/pass/passphrase -d ~/df/pass/clipper.gpg";
      smtp = {
        host = "clipper.ens.fr";
      };
      userName = "jmalka";
    };
};
}
