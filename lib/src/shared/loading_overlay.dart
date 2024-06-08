part of 'package.dart';

final loadingProvider = StateNotifierProvider<LoadingNotifier, bool>((ref) {
  return LoadingNotifier();
});

class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier() : super(false);

  void showLoading() {
    if (!state) state = true;
  }

  void closeLoading() {
    if (state) state = false;
  }
}

//*-----------------------------------------------------------------------------

class LoadingOverlay extends ConsumerWidget {
  const LoadingOverlay({
    required this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool loadingState = ref.watch(loadingProvider);

    return Stack(
      children: [
        if (child != null) child!,
        if (loadingState)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (loadingState)
          const Align(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
