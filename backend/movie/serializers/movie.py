from rest_framework import serializers

from movie.models.movie import Movie
from movie.serializers.actor import ActorSerializer
from movie.serializers.review import ReviewSerializer


class MovieSerializer(serializers.ModelSerializer):
    average_grade = serializers.SerializerMethodField()

    class Meta:
        model = Movie
        fields = ('id', 'title', 'description', 'actors', 'average_grade')

    def get_average_grade(self, obj):
        return obj.average_grade()

class MovieDetailSerializer(serializers.ModelSerializer):
    actors = ActorSerializer(many=True, read_only=True)
    reviews = ReviewSerializer(many=True, read_only=True)

    class Meta:
        model = Movie
        fields = ('id', 'title', 'description', 'actors', 'reviews')
