import '../../core/index.dart';

class ImageViewPagerList extends StatelessWidget {
  const ImageViewPagerList({super.key, this.files = const []});

  final List<FileNetworkAsset> files;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth,
      child: Stack(
        children: [
          PageView(
            children: [
              for (final image in files)
                if (image.type == AssetType.image)
                  Image.network(
                    image.path,
                    height: screenWidth,
                    fit: BoxFit.cover,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

class FileNetworkAsset {
  final String path;
  final String name;
  final AssetType type;

  const FileNetworkAsset({
    required this.path,
    this.name = '',
    this.type = AssetType.file,
  });

  String get extension => path.split('.').last;

  String get mimeType {
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'mp4':
        return 'video/mp4';
      case 'mp3':
        return 'audio/mpeg';
      case 'pdf':
        return 'application/pdf';
      default:
        return 'application/octet-stream';
    }
  }

  String get assetType {
    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return 'image';
      case 'mp4':
        return 'video';
      case 'mp3':
        return 'audio';
      case 'pdf':
        return 'pdf';
      default:
        return 'file';
    }
  }
}

enum AssetType {
  image,
  video,
  audio,
  file,
  pdf,
}
