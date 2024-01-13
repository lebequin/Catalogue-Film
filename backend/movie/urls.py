from rest_framework.routers import DefaultRouter
from movie.views import MovieViewSet,ReviewViewSet

router = DefaultRouter()
router.register(r'movies', MovieViewSet, basename='movie')
router.register(r'reviews', ReviewViewSet, basename='review')
urlpatterns = router.urls