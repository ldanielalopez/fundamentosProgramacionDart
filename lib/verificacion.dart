import 'modelo_analisis.dart';

class Verificacion {
  ModeloAnalisis modeloEvaluado;
  String fecha;
  String responsable;
  late double porcentaje;
  late String estadoFinal;
  String observaciones;

  Verificacion({
    required this.modeloEvaluado,
    required this.fecha,
    required this.responsable,
    this.observaciones = '',
  }) {
    // Calcula automáticamene
    porcentaje = modeloEvaluado.calcularPorcentajeCumplimiento();
    estadoFinal = modeloEvaluado.determinarEstadoModelo();
  }

  // Método para mostrar los datos de la verificación
  void mostrarVerificacion() {
    print("--- DATOS DE LA VERIFICACIÓN ---");
    print("Modelo evaluado: ${modeloEvaluado.nombre}");
    print("Fecha:           $fecha");
    print("Responsable:     $responsable");
    print("Porcentaje:      ${porcentaje.toStringAsFixed(0)}%");
    print("Estado final:    $estadoFinal");
    if (observaciones.isNotEmpty) {
      print("Observaciones:   $observaciones");
    }
    print("--------------------------------\n");
  }

  // ---EJERCICIO 9 ---
  void generarResumen() {
    int cumplen = 0;
    int noCumplen = 0;
    int requierenRevision = 0;

    for (var criterio in modeloEvaluado.criterios) {
      String estado = criterio.estado.toLowerCase();
      if (estado == 'cumple') {
        cumplen++;
      } else if (estado == 'no cumple') {
        noCumplen++;
      } else {
        requierenRevision++;
      }
    }

    print("========================================");
    print("      RESULTADO DE LA VERIFICACIÓN      ");
    print("========================================");
    print("Modelo: ${modeloEvaluado.nombre}");
    print("Total de criterios: ${modeloEvaluado.contarCriterios()}");
    print("Cumplen: $cumplen");
    print("No cumplen: $noCumplen");
    print("En revisión: $requierenRevision");
    print("");
    print("Cumplimiento: ${porcentaje.toStringAsFixed(0)}%");
    print("Estado: ${estadoFinal.toUpperCase()}");
    print("========================================\n");
  }


}