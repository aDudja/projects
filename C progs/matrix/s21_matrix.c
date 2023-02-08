#include "s21_matrix.h"

int s21_create_matrix(int rows, int columns, matrix_t *result) {
  int result_code = 0;
  if (rows > 0 && columns > 0) {
    result->rows = rows;
    result->columns = columns;
    result->matrix = (double **)calloc(rows, sizeof(double *));
    for (int i = 0; i < rows; i++) {
      result->matrix[i] = (double *)calloc(columns, sizeof(double));
      if (!result->matrix[i]) {
        result->rows = i;
        s21_remove_matrix(result);
        result_code = 1;
        break;
      }
    }
  } else {
    result_code = 1;
  }
  return result_code;
}

void s21_remove_matrix(matrix_t *A) {
  if (A->matrix != NULL && A->rows > 0 && A->columns > 0) {
    for (int i = 0; i < A->rows; i++) {
      free(A->matrix[i]);
    }
    free(A->matrix);
  }
}

void matrix_fill(matrix_t *A, double n) {
  for (int i = 0; i < A->rows; i++) {
    for (int j = 0; j < A->columns; j++) {
      *(*(A->matrix + i) + j) = n;
    }
  }
}

int size_compare(matrix_t *A, matrix_t *B) {
  if (A->rows != B->rows || A->columns != B->columns) {
    return FAILURE;
  }
  return SUCCESS;
}
int s21_eq_matrix(matrix_t *A, matrix_t *B) {
  if (size_compare(A, B) == SUCCESS) {
    for (int i = 0; i < A->rows; i++) {
      for (int k = 0; k < A->columns; k++) {
        if (fabsl(A->matrix[i][k] - B->matrix[i][k]) >= 1e-7) {
          return FAILURE;
        }
      }
    }
  } else {
    return FAILURE;
  }
  return SUCCESS;
}

int s21_sum_matrix(matrix_t *A, matrix_t *B, matrix_t *result) {
  int return_code = 2;
  if (A->rows == B->rows && A->columns == B->columns) {
    return_code = 0;
    s21_create_matrix(A->rows, A->columns, result);
    for (int i = 0; i < A->rows; i++) {
      for (int j = 0; j < A->columns; j++) {
        result->matrix[i][j] = A->matrix[i][j] + B->matrix[i][j];
      }
    }
  }
  return (return_code);
}

int s21_sub_matrix(matrix_t *A, matrix_t *B, matrix_t *result) {
  int return_code = 2;
  if (A->rows == B->rows && A->columns == B->columns) {
    return_code = 0;
    s21_create_matrix(A->rows, A->columns, result);
    for (int i = 0; i < A->rows; i++) {
      for (int j = 0; j < A->columns; j++) {
        result->matrix[i][j] = A->matrix[i][j] - B->matrix[i][j];
      }
    }
  }
  return (return_code);
}

int s21_mult_number(matrix_t *A, double number, matrix_t *result) {
  int return_code = 1;
  if (A->rows > 0 && A->columns > 0) {
    s21_create_matrix(A->rows, A->columns, result);
    for (int i = 0; i < A->rows; i++) {
      for (int j = 0; j < A->columns; j++) {
        result->matrix[i][j] = A->matrix[i][j] * number;
      }
    }
    return_code = 0;
  }
  return (return_code);
}

int s21_mult_matrix(matrix_t *A, matrix_t *B, matrix_t *result) {
  int return_code = 2;
  if (A->rows == B->columns) {
    return_code = 0;
    if (A->rows > B->columns) {
      s21_create_matrix(A->rows, A->rows, result);
    } else {
      s21_create_matrix(B->columns, B->columns, result);
    }
    for (int i = 0; i < A->rows; i++) {
      for (int j = 0; j < B->columns; j++) {
        result->matrix[i][j] = 0;
        for (int k = 0; k < B->rows; k++) {
          result->matrix[i][j] += A->matrix[i][k] * B->matrix[k][j];
        }
      }
    }
  } else if (A->columns <= 0 || B->columns <= 0 || A->rows <= 0 ||
             B->rows <= 0) {
    return_code = 1;

  } else {
    return_code = 2;
  }
  return (return_code);
}

int s21_transpose(matrix_t *A, matrix_t *result) {
  int return_code = 1;
  int count = 0;
  if (A->rows > 0 && A->columns > 0) {
    return_code = 0;
    s21_create_matrix(A->columns, A->rows, result);
    while (count < A->columns) {
      for (int i = 0; i < A->rows; i++) {
        result->matrix[count][i] = A->matrix[i][count];
      }
      count++;
    }
  }
  return return_code;
}

int minor_matrix(matrix_t *A, matrix_t *minor) {
  int error = 0;
  error = s21_create_matrix(A->rows, A->columns, minor);
  matrix_t cut = {0};
  if (error == OK) {
    for (int i = 0; i < A->rows; i++) {
      for (int k = 0; k < A->columns; k++) {
        error = cut_matrix(A, i, k, &cut);
        if (error != OK) break;
        error = s21_determinant(&cut, &minor->matrix[i][k]);
        if (error != OK) break;
        s21_remove_matrix(&cut);
      }
    }
  }
  return error;
}

int s21_calc_complements(matrix_t *A, matrix_t *result) {
  int error = 0;
  if (A->rows != A->columns) {
    return INCORRECT_MATRIX;
  }
  error = minor_matrix(A, result);
  if (error == OK) {
    for (int i = 0; i < A->rows; i++) {
      for (int k = 0; k < A->columns; k++) {
        result->matrix[i][k] *= pow(-1, i + k);
      }
    }
  }
  return error;
}

int cut_matrix(matrix_t *A, int rows_del, int columns_del, matrix_t *R) {
  int error = s21_create_matrix(A->rows - 1, A->columns - 1, R);
  if (error == OK) {
    for (int i = 0, j = 0; i < A->rows; i++) {
      if (i == rows_del) {
        continue;
      }
      for (int k = 0, l = 0; k < A->columns; k++) {
        if (k == columns_del) {
          continue;
        }
        R->matrix[j][l] = A->matrix[i][k];
        l++;
      }
      j++;
    }
  }
  return error;
}

int s21_determinant(matrix_t *A, double *result) {
  if (A->rows != A->columns || A->rows == 0) {
    return CALC_ERROR;
  }
  int error = OK;
  *result = 0;
  if (A->rows == 1) {
    *result = A->matrix[0][0];
  } else if (A->rows == 2) {
    *result =
        A->matrix[0][0] * A->matrix[1][1] - A->matrix[0][1] * A->matrix[1][0];
  } else {
    matrix_t tmp_matrix2 = {0};
    double tmp = 0;
    for (int row = 0; error == OK && row < A->rows; row++) {
      error = cut_matrix(A, row, 0, &tmp_matrix2);
      if (error == OK) {
        error = s21_determinant(&tmp_matrix2, &tmp);
        if (error == OK) {
          *result += tmp * A->matrix[row][0] * ((row % 2 == 1) ? -1 : 1);
        }
      }
      s21_remove_matrix(&tmp_matrix2);
    }
  }
  return error;
}

int s21_inverse_matrix(matrix_t *A, matrix_t *result) {
  int err = OK;
  if (A != NULL && result != NULL && A->rows > 0 && A->columns > 0) {
    if (A->rows == A->columns) {
      double determinant = 0;
      s21_determinant(A, &determinant);
      if (fabs(determinant) > 1e-6) {
        s21_create_matrix(A->rows, A->columns, result);
        if (A->rows == 1) {
          result->matrix[0][0] = 1.0 / A->matrix[0][0];
        } else {
          matrix_t temp_matrix = {0};
          s21_calc_complements(A, &temp_matrix);
          matrix_t temp_matrix_transpose = {0};
          s21_transpose(&temp_matrix, &temp_matrix_transpose);
          for (int i = 0; i < A->rows; i++) {
            for (int j = 0; j < A->columns; j++) {
              result->matrix[i][j] =
                  temp_matrix_transpose.matrix[i][j] / determinant;
            }
          }
          s21_remove_matrix(&temp_matrix);
          s21_remove_matrix(&temp_matrix_transpose);
        }
      } else {
        err = CALC_ERROR;
      }
    } else {
      err = CALC_ERROR;
    }
  } else {
    err = INCORRECT_MATRIX;
  }
  return err;
}
