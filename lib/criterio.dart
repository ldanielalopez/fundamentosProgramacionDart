

class Criterio {
  final String id;
  final String descripcion;
  String estado;
  String observacion;

  Criterio({
    required this.id,
    required this.descripcion,
    this.estado = 'requiere revision',
    this.observacion = '',
  });


  void cambiarEstado(String nuevoEstado){
    if(['cumple', 'no cumple', 'requiere revision'].contains(nuevoEstado)){
      estado = nuevoEstado;
    } else {
      print('Estado inválido: $nuevoEstado');
    }
  }

  void registrarObservacion(String nuevaObservacion){
    observacion = nuevaObservacion;
  }

  bool cumple(){
    return estado == 'cumple';
  }

  void mostrarInformacion() {
    print('[ID: $id] $descripcion');
    print(' - Estado: $estado');
    if (observacion.isNotEmpty) {
      print(' - Observación: $observacion');
    }
  }
}

