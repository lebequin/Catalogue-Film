from rest_framework import viewsets
from rest_framework.pagination import PageNumberPagination

from movie.models.movie import Movie
from movie.serializers import MovieSerializer

class MoviePagination(PageNumberPagination):
    page_size = 5
    page_size_query_param = 'page_size'
    max_page_size = 100

class MovieViewSet(viewsets.ModelViewSet):
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer
    pagination_class = MoviePagination