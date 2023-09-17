import 'package:get_it/get_it.dart';
import 'package:mvvm/core/injection/injection.dart';
import 'package:mvvm/module/TestModule/page/cart_page.dart';
import 'package:mvvm/module/TestModule/page/dashboard_page.dart';
import 'package:mvvm/module/TestModule/page/detail_page.dart';
import 'package:mvvm/module/TestModule/page/empty_page.dart';
import 'package:mvvm/module/TestModule/page/home_page.dart';
import 'package:mvvm/module/TestModule/page/login_page.dart';
import 'package:mvvm/module/TestModule/page/recover_page.dart';
import 'package:mvvm/module/TestModule/page/register_page.dart';
import 'package:mvvm/module/TestModule/repositories/test_remote_source.dart';
import 'package:mvvm/module/TestModule/repositories/test_repository.dart';
import 'package:mvvm/module/TestModule/service/home_service.dart';
import 'package:mvvm/module/TestModule/viewmodel/cart_viewmodel.dart';
import 'package:mvvm/module/TestModule/viewmodel/detail_viewmodel.dart';
import 'package:mvvm/module/TestModule/viewmodel/empty_viewmodel.dart';
import 'package:mvvm/module/TestModule/viewmodel/home_viewmodel.dart';
import 'package:mvvm/module/TestModule/viewmodel/login_viewmodel.dart';
import 'package:mvvm/module/TestModule/viewmodel/recover_viewmodel.dart';
import 'package:mvvm/module/TestModule/viewmodel/register_viewmodel.dart';

class TestModule extends InjectionModule {
  @override
  void register(GetIt getIt) {
    getIt.registerFactory<HomeService>(
        () => HomeServiceImpl(repository: getIt.get()));
    getIt.registerFactory<TestRepository>(
        () => TestRepositoryImpl(remoteSource: getIt.get()));
    getIt.registerFactory<TestRemoteSource>(
        () => TestRemoteSourceImpl(restClient: getIt.get()));

    getIt.registerFactory<LoginViewModel>(
        () => LoginViewModel(service: getIt.get()));
    getIt.registerFactory<LoginPage>(() => LoginPage(viewModel: getIt.get()));

    getIt.registerFactory<DasboardPage>(() => DasboardPage());

    getIt.registerFactory<MyHomePage>(() => MyHomePage(viewModel: getIt.get()));
    getIt.registerFactory<HomeViewModel>(() => HomeViewModel(getIt.get()));

    getIt.registerFactory<CartPageViewModel>(() => CartPageViewModel());
    getIt.registerFactory<CartPage>(() => CartPage(viewModel: getIt.get()));

    getIt.registerFactory<RegisterViewModel>(() => RegisterViewModel());
    getIt.registerFactory<RegisterPage>(
        () => RegisterPage(viewModel: getIt.get()));

    getIt.registerFactory<RecoverViewModel>(() => RecoverViewModel());
    getIt.registerFactory<RecoverPage>(
        () => RecoverPage(viewModel: getIt.get()));

    getIt.registerFactory<DetailViewModel>(() => DetailViewModel());
    getIt.registerFactory<DetailPage>(() => DetailPage(viewModel: getIt.get()));

    getIt.registerFactory<EmptyPageViewModel>(() => EmptyPageViewModel());
    getIt.registerFactory<EmptyPage>(() => EmptyPage(viewModel: getIt.get()));
  }
}
