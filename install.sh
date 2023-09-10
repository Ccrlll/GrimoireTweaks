SKIPMOUNT=true
PROPFILE=true
POSTFSDATA=true
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
  unzip -o "$ZIPFILE" 'GrimoireTweaks/*' -d $MODPATH >&2
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/GrimoireTweaks 0 0 0755 0700
}