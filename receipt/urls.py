from django.urls import path

from . import views

urlpatterns = [
    path("", views.ReceiptListView.as_view()),
    path("<int:receipt_id>/", views.ReceiptDetailView.as_view()),
]
