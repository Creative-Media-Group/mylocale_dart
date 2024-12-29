#ifndef FLUTTER_PLUGIN_MYLOCALE_DART_PLUGIN_H_
#define FLUTTER_PLUGIN_MYLOCALE_DART_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace mylocale_dart {

class MylocaleDartPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MylocaleDartPlugin();

  virtual ~MylocaleDartPlugin();

  // Disallow copy and assign.
  MylocaleDartPlugin(const MylocaleDartPlugin&) = delete;
  MylocaleDartPlugin& operator=(const MylocaleDartPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace mylocale_dart

#endif  // FLUTTER_PLUGIN_MYLOCALE_DART_PLUGIN_H_
