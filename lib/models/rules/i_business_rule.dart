abstract class IBusinessRule<T> {
  int get priority;
  bool evaluate(T context);
  void execute(T context);
}