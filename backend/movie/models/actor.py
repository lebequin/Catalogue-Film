from django.db import models


class Actor(models.Model):
    first_name = models.CharField(max_length=128)
    last_name = models.CharField(max_length=128)
    movies = models.ManyToManyField('Movie', related_name='actors', blank=True)


    class Meta:
        verbose_name = 'Actor'
        ordering = ('last_name', 'first_name')