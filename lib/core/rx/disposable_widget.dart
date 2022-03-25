import 'dart:async';

extension DisposableStreamSubscriton on StreamSubscription {
  void canceledBy(DisposableWidget widget) {
    widget.addSubscription(this);
  }
}

class DisposableWidget {
  final List<StreamSubscription> _subscriptions = [];
  void cancelSubscriptions() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
  }

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }
}
