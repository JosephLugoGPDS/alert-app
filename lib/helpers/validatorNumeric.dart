
bool isNumeric( String s) {
  if (s.isEmpty) return false;
  //parseamos a numero
  final n = num.tryParse(s);

  return (n == null)? false: true;

}