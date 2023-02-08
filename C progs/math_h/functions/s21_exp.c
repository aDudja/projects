#include "../s21_math.h"

long double s21_exp(double x) {
  long double expy = 1;
  if (x != x) {
    expy = s21_NAN;
  } else if (x == s21_INFINITY) {
    expy = s21_INFINITY;
  } else if (x == -s21_INFINITY) {
    expy = 0.0;
  } else {
    long double x_stage = x;
    for (int n = 1; s21_fabs(x_stage) > 0.0000001; n++) {
      if (n >= 2) {
        x_stage = x_stage * x;
      }
      x_stage = x_stage / n;
      expy += x_stage;
    }
  }
  return expy;
}
