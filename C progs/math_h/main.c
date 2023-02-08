#include <stdio.h>
#include <math.h>
#include "s21_math.h"

int main() {
  double x;
  double y;
  scanf("%lf", &x);
  scanf("%lf", &y);
  long double res = pow(x, y);
  long double res21 = s21_pow(x, y);
  printf("%Lf\n", res);
  printf("%Lf\n", res21);
}
