from django.conf import settings
from django.contrib import admin
from django.urls import include, path
from django.views.generic import TemplateView

import cookiecutter_niicck_django.base.views as base_views

urlpatterns = [
    path("", TemplateView.as_view(template_name="home.html"), name="home"),
    path("ping/", base_views.ping, name="ping"),
    path("admin/", admin.site.urls, name="admin"),
    path("404/", TemplateView.as_view(template_name="404.html"), name="404"),
]

if settings.DEBUG:
    urlpatterns = urlpatterns + [
        path("__reload__/", include("django_browser_reload.urls"))
    ]
