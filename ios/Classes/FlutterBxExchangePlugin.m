#import "FlutterBxExchangePlugin.h"
#import <flutter_bx_exchange/flutter_bx_exchange-Swift.h>

@implementation FlutterBxExchangePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterBxExchangePlugin registerWithRegistrar:registrar];
}
@end
