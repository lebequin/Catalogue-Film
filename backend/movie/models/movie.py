from django.db import models
from django.db.models import Avg

class Movie(models.Model):
    title = models.CharField(max_length=256)
    description = models.TextField()

    @property
    def average_grade(self):
        if self.reviews.exists():
            return round(self.reviews.aggregate(Avg('grade'))['grade__avg'], 2)
        return 0
    
    class Meta:
        ordering = ('-pk',)