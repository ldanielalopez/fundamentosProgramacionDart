import '../lib/criterio.dart';
import '../lib/modelo_analisis.dart';
import '../lib/verificacion.dart';

void main() {
  print("==================================================");
  print("  SIMULACIÓN MÓDULO DE VERIFICACIÓN - APP MÓVIL  ");
  print("==================================================\n");

  // 1. Crear los 4 modelos de análisis con sus respectivos criterios iniciales
  ModeloAnalisis modeloCasosUso = ModeloAnalisis(
    id: "MOD-01",
    nombre: "Modelo de casos de uso",
    descripcion: "Verificación de actores, flujos principales y alternativos.",
    criterios: [
      Criterio(id: "CU-01", descripcion: "¿Están identificados todos los actores principales?"),
      Criterio(id: "CU-02", descripcion: "¿Se describen los flujos alternativos de error?"),
      Criterio(id: "CU-03", descripcion: "¿Las precondiciones y postcondiciones son claras?"),
    ],
  );

  ModeloAnalisis modeloActividades = ModeloAnalisis(
    id: "MOD-02",
    nombre: "Modelo de actividades",
    descripcion: "Validación de puntos de decisión y flujos de procesos.",
    criterios: [
      Criterio(id: "ACT-01", descripcion: "¿Cada actividad tiene un evento de inicio y fin claro?"),
      Criterio(id: "ACT-02", descripcion: "¿Los flujos de decisión están correctamente acoplados?"),
    ],
  );

  ModeloAnalisis modeloSecuencia = ModeloAnalisis(
    id: "MOD-03",
    nombre: "Modelo de secuencia",
    descripcion: "Comprobación de mensajes e interacciones entre objetos.",
    criterios: [
      Criterio(id: "SEQ-01", descripcion: "¿Los mensajes reflejan correctamente los métodos del sistema?"),
    ],
  );

  ModeloAnalisis modeloClases = ModeloAnalisis(
    id: "MOD-04",
    nombre: "Modelo de clases",
    descripcion: "Revisión de atributos, métodos y relaciones (asociación, herencia).",
    criterios: [
      Criterio(id: "CLS-01", descripcion: "¿Las clases tienen definidos sus tipos de datos en atributos?"),
      Criterio(id: "CLS-02", descripcion: "¿Las multiplicidades en las asociaciones son correctas?"),
    ],
  );

  // 2. Simular el proceso de evaluación, cambios de estado y observaciones
  
  // Evaluando el Modelo de Casos de Uso
  modeloCasosUso.criterios[0].cambiarEstado("cumple");
  modeloCasosUso.criterios[1].cambiarEstado("cumple");
  modeloCasosUso.criterios[2].cambiarEstado("no cumple");
  modeloCasosUso.criterios[2].registrarObservacion("Faltan definir las postcondiciones del flujo principal.");

  // Evaluando el Modelo de Actividades (Todos cumplen)
  modeloActividades.criterios[0].cambiarEstado("cumple");
  modeloActividades.criterios[1].cambiarEstado("cumple");

  // Evaluando el Modelo de Secuencia (Queda en revisión)
  modeloSecuencia.criterios[0].cambiarEstado("requiere revision");
  modeloSecuencia.criterios[0].registrarObservacion("Pendiente validar con el diagrama de arquitectura.");

  // Evaluando el Modelo de Clases
  modeloClases.criterios[0].cambiarEstado("cumple");
  modeloClases.criterios[1].cambiarEstado("no cumple");
  modeloClases.criterios[1].registrarObservacion("Revisar la cardinalidad entre Usuario y Rol.");

  // 3. Generar las Verificaciones y sus respectivos resúmenes
  
  Verificacion verif1 = Verificacion(
    modeloEvaluado: modeloCasosUso,
    fecha: "2026-09-21",
    responsable: "Laura Lopez",
    observaciones: "Se encontraron observaciones críticas en el flujo alternativo.",
  );
  verif1.generarResumen();

  Verificacion verif2 = Verificacion(
    modeloEvaluado: modeloActividades,
    fecha: "2026-09-21",
    responsable: "Laura Lopez",
  );
  verif2.generarResumen();

  Verificacion verif3 = Verificacion(
    modeloEvaluado: modeloSecuencia,
    fecha: "2026-09-21",
    responsable: "Laura Lopez",
  );
  verif3.generarResumen();

  Verificacion verif4 = Verificacion(
    modeloEvaluado: modeloClases,
    fecha: "2026-09-21",
    responsable: "Laura Lopez",
  );
  verif4.generarResumen();
}