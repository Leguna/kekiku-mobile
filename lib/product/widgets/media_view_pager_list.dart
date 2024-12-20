import '../../core/index.dart';
import '../../core/widgets/my_video_player.dart';

class MediaViewPagerList extends StatefulWidget {
  const MediaViewPagerList(
      {super.key, this.files = const [], this.onPageChanged});

  final List<FileNetworkAsset> files;
  final Function(int)? onPageChanged;

  @override
  State<MediaViewPagerList> createState() => MediaViewPagerListState();
}

class MediaViewPagerListState extends State<MediaViewPagerList> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    widget.onPageChanged?.call(index);
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth,
      child: Stack(
        children: [
          PageView(
            onPageChanged: _onPageChanged,
            controller: pageController,
            children: [
              for (final image in widget.files)
                if (image.type == AssetType.image)
                  Image.network(image.path,
                      height: screenWidth, fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : const Center(child: CircularProgressIndicator());
                  })
                else if (image.type == AssetType.video)
                  MyVideoPlayer(
                    videoUrl: image.path,
                    onFullscreen: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Material(
                            child: MyVideoPlayer(
                              videoUrl: image.path,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
            ],
          ),
          AnimatedPositioned(
            top: 0,
            left: currentPage == 0 ? -32 : 0,
            bottom: 0,
            duration: const Duration(milliseconds: 300),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  changePage(0);
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(Dimens.small),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      changePage(0);
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 16,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: currentPage == 0 ? 0 : 1,
              child: Container(
                padding: const EdgeInsets.all(Dimens.small),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(Dimens.small),
                ),
                child: Text(
                  '${currentPage + 1}/${widget.files.length}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // Corner top radius
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Dimens.small),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changePage(int index) {
    pageController.jumpToPage(
      index,
    );
  }
}

class FileNetworkAsset {
  final String path;
  final String name;
  final AssetType type;

  const FileNetworkAsset({
    this.path = '',
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
