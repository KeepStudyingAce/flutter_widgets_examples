import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter_widgets_example/pages/home/home/azlistview/models.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class CommonUtils {
  //检查功能权限
  static Future<bool> checkPermission(PermissionGroup permissionGroup) async {
    PermissionStatus status =
        await PermissionHandler().checkPermissionStatus(permissionGroup);
    return status == PermissionStatus.granted;
  }

  // 申请权限
  static Future<bool> requestPermission(PermissionGroup permissionGroup) async {
    bool hasPermission = await checkPermission(permissionGroup);
    if (!hasPermission) {
      Map<PermissionGroup, PermissionStatus> map =
          await PermissionHandler().requestPermissions(<PermissionGroup>[
        permissionGroup // 在这里添加需要的权限
      ]);
      PermissionStatus permissionStatus = map[permissionGroup];
      if (PermissionStatus.granted != permissionStatus) {
        return false;
      }
    }
    return true;
  }

  ///==========================保存图片到本地============================
  static Future<bool> saveImage(Uint8List pngBytes) async {
    bool saveSuccess = false;
    try {
      bool requestPermissionSuccess =
          await requestPermission(PermissionGroup.storage);
      if (!requestPermissionSuccess) {
        return false;
      }

      /// result 当Platform.isIOS result 返回值为bool
      /// 当Platform.isAndroid result 返回值为string  是保存的路径
      final result = await ImageGallerySaver.saveImage(pngBytes); //这个对象就是图片数据

      if (Platform.isIOS) {
        saveSuccess = result["isSuccess"];
      } else {
        saveSuccess = (result != null && result != '');
      }

      return saveSuccess;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static String getImgPath(String name) {
    return 'lib/assets/$name';
  }

  static Widget getWidget(String url) {
    if (url.startsWith('http')) {
      //return CachedNetworkImage(imageUrl: url, fit: BoxFit.cover);
      return Image.network(url, fit: BoxFit.cover);
    }
    return Image.asset(getImgPath(url), fit: BoxFit.cover);
  }

  static Widget getListItem(BuildContext context, CityModel model,
      {double susHeight = 40}) {
    return ListTile(
      title: Text(model.name),
      onTap: () {
        ToastUtil.showSnackBar(context, 'onItemClick : ${model.name}');
      },
    );
  }

  static Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  static Widget getWeChatListItem(
    BuildContext context,
    ContactInfo model, {
    double susHeight = 40,
    Color defHeaderBgColor,
  }) {
    return getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor);
  }

  static Widget getWeChatItem(
    BuildContext context,
    ContactInfo model, {
    Color defHeaderBgColor,
  }) {
    DecorationImage image;

    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          color: model.bgColor ?? defHeaderBgColor,
          image: image,
        ),
        child: model.iconData == null
            ? null
            : Icon(
                model.iconData,
                color: Colors.white,
                size: 20,
              ),
      ),
      title: Text(model.name),
      onTap: () {
        ToastUtil.showSnackBar(context, 'onItemClick : ${model.name}');
      },
    );
  }
}
