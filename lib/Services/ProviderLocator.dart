import 'package:flutter_app/EntryPoint.dart';
import 'package:flutter_app/Services/IService.dart';
import 'package:flutter_app/Services/IService.dart';

class ProviderLocator{

  //map : for each ViewModel we map it's ProvidersInstance
  Map<Type, Object> registredProviders;

  ProviderLocator(){
    this.registredProviders = new Map<Type, Object>();
  }
  Type GetSerive<Type>(){
    var service =  registredProviders[Type];
    if(service == null)
       throw("service not registred in the registredProviders Instance consider to add it in the EntryPoint");
    else
      return service as Type;
  }
  void AddSerivce(Type, service){
    if(!registredProviders.containsValue(service))
      registredProviders[Type] = service;
    else
      throw("service already registred");
  }
}