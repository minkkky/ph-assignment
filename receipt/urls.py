from django.urls import path

from . import views

urlpatterns = [
    path("", views.ReceiptListView.as_view()),
    path("<int:receipt_id>/", views.ReceiptDetailView.as_view()),
    path("<int:receipt_id>/shared/", views.PermalinkAdminView.as_view()),
    path("shared/<int:permalink_id>/", views.PermalinkView.as_view()),
]
