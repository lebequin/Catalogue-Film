from django.contrib import admin

from movie.models import Movie, Review, Actor


@admin.register(Movie)
class MovieAdmin(admin.ModelAdmin):
    list_display = ('pk', 'title', 'description')

@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('pk', 'grade', 'movie')

@admin.register(Actor)
class ActorAdmin(admin.ModelAdmin):
    list_display = ('pk', 'first_name', 'last_name')
