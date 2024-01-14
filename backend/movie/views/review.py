from rest_framework import viewsets

from movie import tasks, simulate_process
from movie.models.review import Review
from movie.serializers.review import ReviewSerializer
from rest_framework.response import Response

class ReviewViewSet(viewsets.ModelViewSet):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        # Trigger Celery task asynchronously
        simulate_process.delay()

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=201, headers=headers)