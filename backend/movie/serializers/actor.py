from rest_framework import serializers

from movie.models.actor import Actor


class ActorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = ('id', 'first_name', 'last_name', 'movies')
