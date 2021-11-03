abstract class ConvertEvent {}

class CapitalizeEvent extends ConvertEvent {
  CapitalizeEvent(this.msg);

  final String msg;
}
