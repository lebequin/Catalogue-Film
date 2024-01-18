from django.db import models
from movie.constantes import GradeChoices
from django.core.validators import MinValueValidator, MaxValueValidator

from movie.models import Movie

class Review(models.Model):

    grade = models.IntegerField(
        choices=GradeChoices.choices,
        validators=[MinValueValidator(GradeChoices.GRADE_1), MaxValueValidator(GradeChoices.GRADE_5)]
    )
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='reviews')