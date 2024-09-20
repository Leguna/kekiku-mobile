import 'dart:convert';
import 'dart:io';

String fileNameFromPath(String path) {
  return path.split('/').last;
}

bool isFilePathVideo(String filePath) {
  final videoExtensions = ['mp4'];
  final extension = filePath.split('.').last.toLowerCase();
  return videoExtensions.contains(extension);
}

bool isFilePathImage(String filePath) {
  final imageExtensions = ['jpg', 'jpeg', 'png'];
  final extension = filePath.split('.').last.toLowerCase();
  return imageExtensions.contains(extension);
}

List<String> filesToBase64(List<String> filePaths) {
  return filePaths.map((filePath) {
    final file = File(filePath);
    final bytes = file.readAsBytesSync();
    return base64Encode(bytes);
  }).toList();
}

String fileToBase64(String filePath) {
  final file = File(filePath);
  final bytes = file.readAsBytesSync();
  return base64Encode(bytes);
}

bool isPathUrl(String path) {
  return path.startsWith('http') || path.startsWith('https');
}

