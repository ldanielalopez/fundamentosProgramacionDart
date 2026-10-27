import 'criterio.dart';

class ModeloAnalisis {
  String id;
  String nombre;
  String descripcion;
  List<Criterio> criterios;

  // Constructor (si no se pasan criterios, se inicia como una lista vacía)
  ModeloAnalisis({
    required this.id,
    required this.nombre,
    required this.descripcion,
    List<Criterio>? criterios,
  }) : criterios = criterios ?? [];

  // Método para mostrar la información general del modelo y sus criterios
  void mostrarModelo() {
    print("========================================");
    print("MODELO: $nombre (ID: $id)");
    print("Descripción: $descripcion");
    print("Total de criterios: ${contarCriterios()}");
    print("----------------------------------------");
    if (criterios.isEmpty) {
      print("No hay criterios registrados en este modelo.");
    } else {
      for (var criterio in criterios) {
        criterio.mostrarInformacion();
      }
    }
    print("========================================\n");
  }

  // --- MÉTODOS DEL EJERCICIO 4 ---

  void agregarCriterio(Criterio criterio) {
    criterios.add(criterio);
    print("-> Criterio '${criterio.id}' agregado exitosamente al modelo '$nombre'.");
  }

  int contarCriterios() {
    return criterios.length;
  }


  Criterio? buscarCriterio(String idBuscado) {
    try {
      return criterios.firstWhere((c) => c.id == idBuscado);
    } catch (e) {
      return null;
    }
  }

  // --- MÉTODO DEL EJERCICIO 5 ---
  void verificarCriterios() {
    int cumplen = 0;
    int noCumplen = 0;
    int requierenRevision = 0;

    for (var criterio in criterios) {
      String estadoActual = criterio.estado.toLowerCase();

      if (estadoActual == 'cumple') {
        cumplen++;
      } else if (estadoActual == 'no cumple') {
        noCumplen++;
      } else {
        requierenRevision++;
      }
    }

    print("--- EVALUACIÓN DE CRITERIOS: $nombre ---");
    print(" - Cumplen: $cumplen");
    print(" - No cumplen: $noCumplen");
    print(" - Requieren revisión: $requierenRevision");
    print("------------------------------------------");
  }

  // --- MÉTODO DEL EJERCICIO 6 ---
  double calcularPorcentajeCumplimiento() {
    if (criterios.isEmpty) return 0.0;

    int cumplen = 0;
    for (var criterio in criterios) {
      if (criterio.estado.toLowerCase() == 'cumple') {
        cumplen++;
      }
    }

    return (cumplen / criterios.length) * 100;
  }

  // --- MÉTODO DEL EJERCICIO 7 ---
  String determinarEstadoModelo() {
    if (criterios.isEmpty) return 'Sin criterios';

    bool hayNoCumplen = false;
    bool hayEnRevision = false;
    bool todosCumplen = true;

    for (var criterio in criterios) {
      String estado = criterio.estado.toLowerCase();
      
      if (estado == 'no cumple') {
        hayNoCumplen = true;
        todosCumplen = false;
      } else if (estado == 'requiere revision') {
        hayEnRevision = true;
        todosCumplen = false;
      } else if (estado != 'cumple') {
        todosCumplen = false;
      }
    }

    if (hayNoCumplen) {
      return 'Requiere ajustes';
    } else if (hayEnRevision) {
      return 'En revisión';
    } else if (todosCumplen) {
      return 'Aprobado';
    } else {
      return 'En revisión';
    }
  }
}

void main() {
  // Creación de modelos de análisis
  ModeloAnalisis modeloCasosUso = ModeloAnalisis(
    id: "MOD-01",
    nombre: "Modelo de casos de uso",
    descripcion: "Verificación de actores, flujos principales y alternativos.",
    criterios: [
      Criterio(id: "C1", descripcion: "¿Están identificados todos los actores principales?"),
      Criterio(id: "C2", descripcion: "¿Se describen los flujos alternativos de error?"),
    ],
  );

  // Probando cambios de estado
  modeloCasosUso.criterios[0].cambiarEstado("cumple");
  modeloCasosUso.criterios[1].cambiarEstado("cumple");

  // Ejecutando verificación, porcentaje y estado general
  modeloCasosUso.verificarCriterios();
  
  double porcentaje = modeloCasosUso.calcularPorcentajeCumplimiento();
  print("Porcentaje de cumplimiento: ${porcentaje.toStringAsFixed(0)}%");
  
  String estadoGeneral = modeloCasosUso.determinarEstadoModelo();
  print("Estado general del modelo: $estadoGeneral\n");
}