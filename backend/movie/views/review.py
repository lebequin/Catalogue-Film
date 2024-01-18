from rest_framework import viewsets

from movie import tasks, simulate_process
from movie.models.review import Review
from movie.serializers.review import ReviewSerializer

class ReviewViewSet(viewsets.ModelViewSet):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

    def create(self, request, *args, **kwargs):
        response = super(ReviewViewSet, self).create(request, *args, **kwargs)

        # Celery 10 seconds task
        simulate_process.delay()

        return response