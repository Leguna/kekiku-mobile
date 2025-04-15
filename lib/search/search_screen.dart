import 'package:kekiku/home/widgets/list_infinite_product.dart';
import 'package:kekiku/search/blocs/search_cubit.dart';

import '../core/index.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = SearchCubit();
    return BlocProvider(
      create: (context) => searchCubit,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return MyScaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: TextFormField(
                focusNode: focusNode,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Search',
                ),
                onChanged: (value) {
                  context.read<SearchCubit>().type(value);
                },
                onSaved: (value) {
                  context.read<SearchCubit>().search();
                },
              ),
              titleSpacing: 0,
              actions: const [
                SizedBox(width: Dimens.small),
              ],
            ),
            body: ListInfiniteProduct(
              showFavorite: false,
              state: searchCubit.pagingState,
              onNextPage: () {},
            ),
          );
        },
      ),
    );
  }
}
