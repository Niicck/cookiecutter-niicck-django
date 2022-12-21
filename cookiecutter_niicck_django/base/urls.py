import settings
from django.contrib import admin
from django.urls import include, path
from django.views.generic import TemplateView

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", TemplateView.as_view(template_name="home.html")),
]

if settings.DEBUG:
    urlpatterns = urlpatterns + [
        path("__reload__/", include("django_browser_reload.urls"))
    ]
