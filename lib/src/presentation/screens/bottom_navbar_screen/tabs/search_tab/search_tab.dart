import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/search_function_controller.dart';
import '../../../../widgets/app_progress_indicator.dart';
import '../../../../widgets/list_item/search_list_item.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController searchETController;

  @override
  void initState() {
    super.initState();
    searchETController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchETController.dispose();
  }

  Future<void> onChange(String value) async {
    await Provider.of<SearchFunctionController>(context, listen: false)
        .onSearch(value);
  }

  void onSubmit(String val) {
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: searchBar(),
          ),
          Expanded(
            child: Consumer<SearchFunctionController>(
              builder: (context, searchController, _) {
                if (searchController.searching) {
                  return const AppProgressIndicator();
                } else {
                  if (searchController.searchList.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Results found",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: resultBody(searchController),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget resultBody(SearchFunctionController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: controller.searchList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => SearchListItem(
          item: controller.searchList[index],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        autofocus: false,
        controller: searchETController,
        onChanged: onChange,
        onSubmitted: onSubmit,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.amber.withOpacity(0.6),
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
