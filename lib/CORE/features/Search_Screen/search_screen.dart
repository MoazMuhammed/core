import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController _searchController = SearchController();
  final leading = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SearchAnchor(
            searchController: _searchController,
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp)),
                leading: leading,
                onTap: () {
                  _searchController.openView();
                },
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              final keyword = controller.value.text;
              return List.generate(5, (index) => 'Item $index')
                  .where((element) => element.toLowerCase().startsWith(keyword.toLowerCase()))
                  .map((item) => ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                    FocusScope.of(context).unfocus();
                  });
                },
              ));
            },
          ),
          Expanded(
            child: Center(
              child: _searchController.text.isEmpty
                  ? const Text('No keyword')
                  : Text('Keyword: ${_searchController.value.text}'),
            ),
          ),
        ],
      ),
    );
  }
}
