/*
CLASE: para el formato de las fechas
*/
class FormatDatatimeService {
  static String formatHora(DateTime dateTime) {
    List<String> dias = [
      "Domingo",
      "Lunes",
      "Martes",
      "Miércoles",
      "Jueves",
      "Viernes",
      "Sábado"
    ];
    String diaSemana = dias[dateTime.weekday % 7]; // weekday va de 1 a 7

    int hora = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    String minuto = dateTime.minute.toString().padLeft(2, '0');
    String amPm = dateTime.hour >= 12 ? "pm" : "am";

    return "$diaSemana, $hora:$minuto $amPm";
  }

  static String formatFecha(DateTime dateTime) {
    List<String> meses = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre"
    ];
    String mes = meses[dateTime.month - 1];
    String dia = dateTime.day.toString().padLeft(2, '0');

    return "$mes $dia, ${dateTime.year}";
  }
}
