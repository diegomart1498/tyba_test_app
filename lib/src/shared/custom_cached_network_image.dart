part of 'package.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
    this.imageUrl, {
    this.borderRadius = BorderRadius.zero,
    this.height,
    this.width,
    super.key,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        fadeInDuration: const Duration(microseconds: 200),
        fadeOutDuration: const Duration(microseconds: 300),
        key: UniqueKey(),
        imageUrl: imageUrl,
        height: height ?? UISize.p176,
        width: width ?? double.infinity,
        fit: BoxFit.contain,
        placeholder: (context, url) => const TextShimmer(
          height: UISize.p176,
          width: double.infinity,
        ),
        errorWidget: (context, url, error) {
          return const Align(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
