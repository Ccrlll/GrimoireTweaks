SKIPMOUNT=true
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true

print_modname() {
  ui_print "********************************"
  ui_print "                                "
  ui_print "            Ccrlll              "
  ui_print "                                "
  ui_print "********************************"
  ui_print "********************************"
  ui_print "                                "
  ui_print "        Grimoire Tweaks         "
  ui_print "                                "
  ui_print "********************************"
}

on_install() {
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'script/*' -d $MODPATH >&2
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/script 0 0 0755 0700
}