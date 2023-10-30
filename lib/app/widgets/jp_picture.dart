import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/theme/jp_colors.dart';
import 'package:shimmer/shimmer.dart';

class JpPicture extends StatefulWidget {
  final String? path;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final double width;
  final double height;
  final double progress;
  final VoidCallback? onTap;
  final VoidCallback? onError;

  const JpPicture({
    required this.path,
    super.key,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.width = 100,
    this.height = 100,
    this.progress = 0,
    this.onTap,
    this.onError,
  });

  @override
  State<JpPicture> createState() => _JpPictureState();
}

class _JpPictureState extends State<JpPicture> {
  bool loading = true;
  bool error = false;
  ImageProvider? image;
  String? oldPath;

  @override
  void initState() {
    oldPath = widget.path;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (oldPath != widget.path) {
      oldPath = widget.path;
      image = null;
      error = false;
    }
    if (image == null && !error) {
      _getFromUrl();
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (error)
                _error()
              else if ((loading || image == null) && widget.path != null)
                _Shimmer(
                  width: widget.width,
                  height: widget.height,
                )
              else
                Image(
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                  alignment: widget.alignment,
                  image: image!,
                  errorBuilder: (context, error, stackTrace) {
                    widget.onError?.call();
                    return _error();
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return _Shimmer(
                      height: widget.height,
                      width: widget.width,
                      child: child,
                    );
                  },
                ),
              if (!error) _Progress(progress: widget.progress),
            ],
          ),
        ),
      ),
    );
  }

  Widget _error() {
    final size = Size(widget.width, widget.height);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.all(size.shortestSide * 0.20),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 40.w,
              maxHeight: 40.w,
            ),
            child: FittedBox(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: JpColors.black,
                size: size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _getFromUrl() {
    loading = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        await DefaultCacheManager().getSingleFile(widget.path!).then((value) {
          image = FileImage(value);
        });
      } catch (e) {
        error = true;
        widget.onError?.call();
      } finally {
        loading = false;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }
}

class _Progress extends StatefulWidget {
  final double progress;

  const _Progress({required this.progress});

  @override
  State<_Progress> createState() => _ProgressState();
}

class _ProgressState extends State<_Progress> {
  Timer? timer;
  double progress = 0;
  double oldProgress = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double step = 0;
      timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
        if (progress != widget.progress) {
          if (oldProgress != widget.progress) {
            oldProgress = widget.progress;
            step = (widget.progress - progress) / 100;
          }
          step = step * 1.1;
          progress += step;
          if ((progress - widget.progress).abs() < step.abs()) {
            progress = widget.progress;
          }
          if (mounted) {
            setState(() {});
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: progress,
      strokeWidth: 10,
      valueColor: AlwaysStoppedAnimation<Color>(JpColors.orange),
      backgroundColor: widget.progress == 0 ? null : JpColors.blackLight,
    );
  }
}

class _Shimmer extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;

  const _Shimmer({
    required this.width,
    required this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: JpColors.blackLight,
      highlightColor: JpColors.white,
      child: Container(
        color: JpColors.white,
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
