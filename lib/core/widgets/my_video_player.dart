import 'package:video_player/video_player.dart';

import '../index.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({
    super.key,
    required this.videoUrl,
    this.height = 300,
    this.onEnd,
    this.onFullscreen,
  });

  final String videoUrl;
  final double height;
  final VoidCallback? onEnd;
  final VoidCallback? onFullscreen;

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;
  late VoidCallback _videoListener;

  bool _isPlaying = false;
  bool _showControls = false;
  bool _isMuted = false;
  bool _isLoading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _controller.initialize().then((_) {
      setState(() {
        _showControls = true;
        _isLoading = false;
      });
    });
    _videoListener = () {
      setState(() {});
      if (_controller.value.position >= _controller.value.duration) {
        widget.onEnd?.call();
        _isPlaying = false;
        _controller.seekTo(const Duration());
      }
    };
    _controller.addListener(_videoListener);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_isLoading) {
      return Container(
        width: double.infinity,
        height: widget.height,
        alignment: Alignment.center,
        color: Colors.black,
        child: const CircularProgressIndicator(),
      );
    }
    return Container(
      width: double.infinity,
      height: widget.height,
      alignment: Alignment.center,
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(
                _controller,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showControls = !_showControls;
              });
            },
          ),
          AnimatedOpacity(
            opacity: _showControls ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlaying ? _controller.pause() : _controller.play();
                        _isPlaying = !_isPlaying;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: _isPlaying
                          ? const Icon(Icons.pause,
                              size: 48, color: Colors.white)
                          : const Icon(Icons.play_arrow,
                              size: 48, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(125),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      formatDuration(_controller.value.position),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _controller.pause();
                          _isPlaying = false;
                          widget.onFullscreen?.call();
                        },
                        icon: const Icon(
                          Icons.fullscreen,
                          size: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _toggleMute();
                        },
                        icon: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_controller.value.volume > 0 ? 0 : 1);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }
}
