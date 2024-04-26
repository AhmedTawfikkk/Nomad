//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_dev_tools/flutter_dev_tools_plugin.h>
#include <flutter_localization/flutter_localization_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_dev_tools_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterDevToolsPlugin");
  flutter_dev_tools_plugin_register_with_registrar(flutter_dev_tools_registrar);
  g_autoptr(FlPluginRegistrar) flutter_localization_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterLocalizationPlugin");
  flutter_localization_plugin_register_with_registrar(flutter_localization_registrar);
}
