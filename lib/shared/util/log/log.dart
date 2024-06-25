//@skip_translation
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hyper_ui/core.dart';

List<String> classLogs = [];
devLog(String className) {
  classLogs.add(className);
  printg('Class: $className');
}

viewCode({
  String? type,
  String? customClass,
}) {
  if (kIsWeb) return;
  if (Platform.isWindows) {
    var className = customClass ?? classLogs.last;
    var targetClass = className;

    if (type == "view") {
      targetClass = className.replaceAll("Controller", "View");
    } else if (type == "controller") {
      //Default
    } else if (type == "service") {
      targetClass = className
          .replaceAll("Controller", "Service")
          .replaceAll("Form", "")
          .replaceAll("List", "");
    } else if (type == "model") {
      targetClass = className
          .replaceAll("Controller", "")
          .replaceAll("Form", "")
          .replaceAll("List", "");
    }

    if (openCodeByClass(targetClass)) return;
    if (type == "service") {
      if (openServiceInClassIfExists(className)) return;
    }

    printr("Code not found for class $targetClass");
    se("Code not found for class $targetClass");
  }
}

openCodeByClass(String targetClass) {
  var dirs =
      Directory("${Directory.current.path}\\lib").listSync(recursive: true);
  for (var f in dirs) {
    if (f is File && f.path.endsWith(".dart")) {
      var content = f.readAsStringSync();
      if (content.contains("class ${targetClass} ")) {
        var script = "code \"${f.path}\"";
        printg(script);
        File("./script.bat").writeAsStringSync(script);
        Process.run("script.bat", []);
        return true;
      }
    }
  }
  return false;
}

openServiceInClassIfExists(targetClass) {
  var dirs =
      Directory("${Directory.current.path}\\lib").listSync(recursive: true);
  for (var f in dirs) {
    if (f is File && f.path.endsWith(".dart")) {
      var content = f.readAsStringSync();
      if (content.contains("class ${targetClass} ")) {
        var codes = content.split(" ");
        var serviceClass =
            codes.where((element) => element.contains("Service")).toList();

        if (serviceClass.isNotEmpty) {
          var service = serviceClass.first.split("(").first;
          printr("SERVICE CLASS ${service}");
          openCodeByClass(service);
          return true;
        }
      }
    }
  }
  return false;
}

p(message) {
  print(message);
}

py(message) {
  printy(message);
}

pr(message) {
  printr(message);
}

pg(message) {
  printg(message);
}

po(message) {
  printo(message);
}

pb(message) {
  printb(message);
}

//--------------

dynamic get pl => p('----------------------');
dynamic get pyl => py('----------------------');
dynamic get prl => pr('----------------------');
dynamic get pgl => pg('----------------------');
dynamic get pol => po('----------------------');
dynamic get pbl => pb('----------------------');

// ~~ PRINT ~~

void printr(dynamic text) {
  print('\x1B[31m$text\x1B[0m'); // Merah
}

void printg(dynamic text) {
  print('\x1B[32m$text\x1B[0m'); // Hijau
}

void printo(dynamic text) {
  print('\x1B[38;5;208m$text\x1B[0m'); // Oranye
}

void printy(dynamic text) {
  print('\x1B[33m$text\x1B[0m'); // Kuning
}

void printb(dynamic text) {
  print('\x1B[34m$text\x1B[0m'); // Biru
}

// ~ SNACKBAR ~ //

ss(dynamic message) {
  snackbarSuccess(message: message.toString());
}

se(dynamic message) {
  snackbarDanger(message: message.toString());
}
