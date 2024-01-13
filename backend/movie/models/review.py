from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

from movie.models import Movie

class Review(models.Model):
    class GradeChoices(models.IntegerChoices):
        GRADE_1 = 1, '1'
        GRADE_2 = 2, '2'
        GRADE_3 = 3, '3'
        GRADE_4 = 4, '4'
        GRADE_5 = 5, '5'

    grade = models.IntegerField(
        choices=GradeChoices.choices,
        validators=[MinValueValidator(GradeChoices.GRADE_1), MaxValueValidator(GradeChoices.GRADE_5)]
    )
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='reviews')

    class Meta:
        ordering = ('grade',)
