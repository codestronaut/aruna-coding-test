import 'package:flutter/material.dart';

class SearchPlaceholder extends StatelessWidget {
  const SearchPlaceholder({
    Key? key,
    this.isQueryEmpty = true,
  }) : super(key: key);

  final bool isQueryEmpty;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isQueryEmpty ? Icons.abc : Icons.inbox_rounded,
            size: 64.0,
            color: Colors.grey[900],
          ),
          const SizedBox(height: 8.0),
          Text(
            isQueryEmpty ? 'Search Something' : 'Not Found',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            isQueryEmpty
                ? 'Start search article by typing an article title\n'
                    'in the search box'
                : 'Ops! The thing you are looking for\n'
                    'seems not availabel in the list',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadFailurePlaceholder extends StatelessWidget {
  const LoadFailurePlaceholder({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error,
            size: 64.0,
            color: Colors.grey[900],
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Load Failed',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'The contents failed to load.\n'
            'Plase check you connection and try again',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16.0),
          IconButton(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            splashRadius: 20.0,
          ),
        ],
      ),
    );
  }
}
