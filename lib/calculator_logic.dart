import 'dart:math';


double suma(double a, double b) {
  return a + b;
}


double resta(double a, double b) {
  return a - b;
}


double multiplicacion(double a, double b) {
  return a * b;
}


double division(double a, double b) {
  if (b == 0) {
    return double.nan;  
  }
  return a / b;
}


double potencia(double a, double b) {
  return pow(a, b).toDouble();
}


double raiz(double a, double b) {
  return a >= 0 ? sqrt(a) : double.nan;
}


double seno(double a, double b) {
  double rad = a * pi / 180; 
  return sin(rad);
}


double coseno(double a, double b) {
  double rad = a * pi / 180; 
  return cos(rad);
}


double tangente(double a, double b) {
  double rad = a * pi / 180; 
  return tan(rad);
}


double esPrimo(double a, double b) {
  int n = a.toInt();
  if (n <= 1) return 0;
  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) return 0;
  }
  return 1; 
}
