#include "include/mylocale_dart/mylocale_dart_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "mylocale_dart_plugin.h"

void MylocaleDartPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  mylocale_dart::MylocaleDartPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
