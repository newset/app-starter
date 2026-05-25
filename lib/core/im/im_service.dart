import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimSDKListener.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';

import '../state/global_app_controller.dart';

class IMService extends GetxService {
  final _sdk = TencentImSDKPlugin.v2TIMManager;

  Future<void> initAndLogin({
    required int sdkAppId,
    required String userId,
    required String userSig,
  }) async {
    await _sdk.initSDK(sdkAppID: sdkAppId, loglevel: 2, listener: V2TimSDKListener());
    final V2TimCallback callback = await _sdk.login(userID: userId, userSig: userSig);
    Get.find<GlobalAppController>().loggedInIM.value = callback.code == 0;
  }
}
