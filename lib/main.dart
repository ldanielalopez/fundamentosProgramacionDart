import 'criterio.dart';
import 'modelo_analisis.dart';
import 'verificacion.dart';

void main() {
  print('========================================');
  print(' SIMULADOR DE VERIFICACIÓN DE MODELOS ');
  print('========================================\n');

  ModeloAnalisis modeloCasosUso = ModeloAnalisis(
    id: 'M01',
    nombre: 'Modelo de casos de uso',
    descripcion: 'Verificación de actores, flujos principales y alternativos.',
    criterios: [],
  );

  ModeloAnalisis modeloActividades = ModeloAnalisis(
    id: 'M02',
    nombre: 'Modelo de actividades',
    descripcion: 'Verificación de nodos de decisión, inicio, fin y flujos.',
    criterios: [],
  );

  modeloCasosUso.agregarCriterio(
    Criterio(
      id: 'C1',
      descripcion: '¿Los actores principales están identificados?',
      estado: 'Cumple',
      observacion: 'Todo en orden.',
    ),
  );

  modeloCasosUso.agregarCriterio(
    Criterio(
      id: 'C2',
      descripcion: '¿Los flujos alternativos contemplan errores de red?',
      estado: 'No cumple',
      observacion: 'Falta detallar el manejo de excepciones de conexión.',
    ),
  );

  modeloCasosUso.agregarCriterio(
    Criterio(
      id: 'C3',
      descripcion: '¿Las inclusiones (include) están bien aplicadas?',
      estado: 'En revisión',
      observacion: 'Pendiente de aprobación con el arquitecto de software.',
    ),
  );

  Verificacion verificacionCasosUso = Verificacion(
    modeloEvaluado: modeloCasosUso,
    fecha: '2026-06-06',
    responsable: 'Daniela',
  );

  verificacionCasosUso.generarResumen();
}