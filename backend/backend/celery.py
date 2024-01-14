from __future__ import absolute_import, unicode_literals
import os

from backend import settings
from celery import Celery

# Celery configuration
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
celery_app = Celery('backend')
celery_app.config_from_object('django.conf:settings', namespace='CELERY')
celery_app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)