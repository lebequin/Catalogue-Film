from django.db import models

class GradeChoices(models.IntegerChoices):
    GRADE_1 = 1, '1'
    GRADE_2 = 2, '2'
    GRADE_3 = 3, '3'
    GRADE_4 = 4, '4'
    GRADE_5 = 5, '5'
