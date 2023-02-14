import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/presentation/bloc/desired/desired_bloc.dart';
import 'package:marketplace/presentation/bloc/desired/desired_event.dart';

class DesiredController extends GetxController {
  static const int shimerProductCount = 3;

  final bloc = DesiredBloc()..add(const DesiredEvent.onLoaded());

  final _checkedDesired = <Desired>[].obs;
  set checkedDesired(List<Desired> value) => _checkedDesired.value = value;
  RxList<Desired> get checkedDesired => _checkedDesired;

  final _desiredProductList = <Desired>[].obs;
  set desiredProductList(List<Desired> value) =>
      _desiredProductList.value = value;
  RxList<Desired> get desiredProductList => _desiredProductList;

  void onAllUnselected() {
    checkedDesired.clear();
  }

  void onAllSelected() {
    checkedDesired = [...desiredProductList];
  }

  void onDeleteSelected() {
    //TODO: Вызвать событие удаления продукта
    desiredProductList
        .removeWhere((desired) => checkedDesired.contains(desired));
    checkedDesired.clear();
  }

  void onRefreshPage() {
    bloc.add(const DesiredEvent.onLoaded());
  }

  void onDesiredCheck(Desired desired, bool value) {
    if (value) {
      checkedDesired.add(desired);
    } else {
      checkedDesired.remove(desired);
    }
  }

  void onProductClick(BuildContext context, Desired desired) {
    context.router.pushNamed('/product/${desired.product.id}');
  }
}
