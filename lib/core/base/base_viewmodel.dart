
import '../rx/disposable_widget.dart';
import 'app_base_viewmodel.dart';


abstract class BaseViewModel<I, O> extends AppBaseViewModel {
  O transform(I input);
}
