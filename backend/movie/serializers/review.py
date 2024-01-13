from rest_framework import serializers

from movie.models.review import Review

class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review
        fields = ('id', 'grade', 'movie')
