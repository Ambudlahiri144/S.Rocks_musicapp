import 'package:flutter/material.dart';
import '../../data/model/service_model.dart';
import '../../data/repos/service_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final ServiceRepository _serviceRepository;

  HomeViewModel(this._serviceRepository) {
    fetchServices();
  }

  List<ServiceModel> _services = [];
  List<ServiceModel> get services => _services;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();
    _services = await _serviceRepository.getServices();
    _isLoading = false;
    notifyListeners();
  }
}